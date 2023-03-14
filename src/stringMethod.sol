// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

/// @title A library for string operations
library stringMethod {
    /// @notice Searches am array and return 1 if found else 0
    /// @param strings an array of strings

    /// @param  check the string we are searching for
    /// @return uint returms either 1 or 0
    function matches(string[] memory strings, string memory check) internal pure returns (uint256) {
        assembly {
            let location := strings
            let length := mload(strings)
            let str := mload(add(check, 0x20))
            for { let i } lt(i, length) { i := add(i, 1) } {
                if eq(mload(add(mload(add(location, mul(i, 0x20))), 0x20)), str) {
                    mstore(0x00, 0x01)
                    return(0x00, 0x20)
                }
                mstore(0x00, 0x00)
                return(0x00, 0x20)
            }
        }
    }

    function slice32(string memory text, uint256 start, uint256 end) internal pure returns (string memory) {
        assembly {
            // load data length
            let length := mload(text)
            // load data pointer
            let location := add(text, 0x20)
            //since each string contain 8 bits we simply remove the starting string by shifing to the left 8 times
            mstore(location, shl(mul(start, 8), mload(location)))
            //update the length
            length := sub(length, start)
            //now remove the specified end part
            mstore(location, shr(mul(end, 8), shr(sub(256, mul(length, 8)), mload(location))))
            //update the length again
            mstore(text, sub(length, end))
            //shift the string to the first position
            mstore(location, shl(sub(256, mul(8, mload(text))), mload(location)))
            //save the length
            mstore(0x00, text)
            //return the sliced string
            return(0x00, add(location, 0x20))
        }
    }

    ///@notice reverses a string
    /// @param text a string to be reversed
    ///@dev this function is slightly incorrect,it works on string without error, also it creates a double string in memory
    function reverses16(string memory text) public pure returns (string memory) {
        assembly {
            // load data length
            let len := mload(text)
            // load data pointer
            let ptr := add(text, 0x20)

            let strin := mload(ptr)

            //set strin to zero emptying the memory slot
            mstore(ptr, 0x00)
            // loop over each bit
            for { let i := 0 } lt(i, len) {} {
                i := add(i, 1)
                mstore(add(ptr, sub(i, 1)), shl(mul(sub(len, i), 8), strin))
                // if eq(i,3){break}
            }
            mstore(0x00, text)
            return(0x00, add(ptr, 0x20))
        }
    }
    /// @notice Concatenates two strings, this only works for string when combined is equal to 32byte else it goes out of bounds
    /// @param a The fit string
    /// @param b The second string
    /// @return result The concatenated string
    function concatenate(string memory a, string memory b) public pure returns (string memory) {
        assembly {
            let red := 0x20
            //pointer to string a
            let ptr := a
            //length of string a
            let len := mload(a)
            //pointer of string b
            let ptrB := b
            //leength of string b
            let lenB := mload(b)
            //add length of both string together and store in location of length of string a
            mstore(ptr, add(len, lenB))
            //no of times memory was used
            let Mem := div(sub(add(mload(a), 0x20), 1), 0x20)
            //this will work for string thats has its length of B less than 32bytes
            if lt(lenB, 33) {
                //add length of both string together and store in location of length of string a
                mstore(add(add(ptr, 0x20), len), mload(add(ptrB, 0x20)))
                //update the free memory
                mstore(0x40, add(add(ptr, 0x20), mul(Mem, 0x20)))
                //save the length
                mstore(0x00, ptr)
                //return the string
                return(0x00, mload(0x40))
            }
            //add length of both string together and store in location of length of string a
            mstore(add(add(ptr, 0x20), len), mload(add(ptrB, 0x20)))

            //loop through and store b immeadiately after b
            for { let i := 1 } lt(i, Mem) { i := add(i, 1) } {
                mstore(add(ptr, add(mul(i, 0x20), len)), mload(add(ptrB, mul(i, 0x20))))
            }
            //update the free memory
            //save the length
            mstore(0x00, ptr)
            //return the string
            return(0x00, mload(0x40))
        }
    }
}
