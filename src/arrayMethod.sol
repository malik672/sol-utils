// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

library Methods {
    ///@dev takes in an array of unsigned Integers and returns a loop
    ///@param arr takes in an array of unsigned Integers
    function forEach(uint256[] memory arr, function (uint256) pure external returns (uint256) func)
        public
        returns (uint256[] memory)
    {
        assembly {
            //get where array is stored in memory
            let location := arr

            //get length of array
            let length := mload(arr)

            //loop through array
            for { let i := 0 } lt(i, length) { i := add(i, 1) } { z := mload(add(add(location, 0x20), mul(0x20, i))) }
        }
    }

    ///@dev takes in an array of unsigned Integers and returns the maximum value in the array
    ///@param arr takes in an array of unsigned Integers
    function max(uint256[] memory arr) external pure returns (uint256 z) {
        assembly {
            //get where array is stored in memory
            let location := arr

            //get length of array
            let length := mload(arr)

            //loop through array and return the maximum
            for { let i := 0 } lt(i, length) { i := add(i, 1) } {
                if gt(z, mload(add(add(location, 0x20), mul(0x20, i)))) {
                    z := mload(add(add(location, 0x20), mul(0x20, i)))
                }
            }
        }
    }

    ///@dev takes in an array of unsigned Integers and returns the minimum value in the array
    ///@param arr takes in an array of unsigned Integers
    function min(uint256[] memory arr) external pure returns (uint256 z) {
        assembly {
            //get where array is stored in memory
            let location := arr

            //get length of array
            let length := mload(arr)

            z := mload(add(location, 0x40))
            //loop through array and return the minimum
            for { let i := 0 } lt(i, length) { i := add(i, 1) } {
                if gt(z, mload(add(add(location, 0x20), mul(0x20, i)))) {
                    z := mload(add(add(location, 0x20), mul(0x20, i)))
                }
            }
        }
    }
}
