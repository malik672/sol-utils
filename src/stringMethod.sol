// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

library stringMethod {
    //concatenation of two strings, just like abi.encodePacked();
    function concatenate(string memory a, string memory b) public pure returns (string memory) {
        assembly {
            let location := a
            let length := mload(a)
            let locationB := b
            let lengthB := mload(b)
            mstore(location, add(length, lengthB))
            mstore(add(add(location, 0x20), length), mload(add(locationB, 0x20)))
            mstore(0x40, add(location, 0x40))
            mstore(0x00, location)
            return(0x00, mload(0x40))
        }
    }

    //function that checks if a particular string is present in a particular array
    function matches(string[] memory strings, string memory check) public pure returns (uint256) {
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

    //comparison of two strings
    function comparison(string memory _a, string memory _b) public pure returns (bool) {
        assembly {
            if eq(mload(add(_a, 0x20)), mload(add(_b, 0x20))) {
                mstore(0x00, 0x01)
                return(0x00, 0x20)
            }
            mstore(0x00, 0x00)
            return(0x00, 0x20)
        }
    }

    function slice(string memory text, uint256 start, uint256 end) public pure returns (string memory) {
        assembly {
            let length := mload(text)
            let location := add(text, 0x20)
            mstore(location, shl(mul(start, 8), mload(location)))
            length := sub(length, start)
            mstore(location, shr(mul(end, 8), shr(sub(256, mul(length, 8)), mload(location))))
            mstore(text, sub(length, end))
            mstore(location, shl(sub(256, mul(8, mload(text))), mload(location)))
            mstore(0x00, text)
            return(0x00, add(location, 0x20))
        }
    }
}
