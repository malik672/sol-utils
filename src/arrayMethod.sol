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

    ///@notice The find() method returns the first element in the provided array that satisfies the provided testing function. If no values satisfy the testing function, undefined is returned.
    ///@dev takes in an array of unsigned Integers and returns the minimum value in the array
    ///@param arr takes in an array of unsigned Integers
    function find(uint256[] memory arr, uint256 _val) external pure returns (uint256 z) {
        assembly {
            //get where array is stored in memory
            let location := arr

            //get length of array
            let length := mload(arr)

            for { let i := 0 } lt(i, length) { i := add(i, 1) } {
                if lt(_val, mload(add(add(location, 0x20), mul(0x20, i)))) {
                    return(add(add(location, 0x20), mul(0x20, i)), 0x20)
                }
            }
        }
    }

    ///@dev takes in an array of unsigned Integers and returns the sorted value in ascending order
    ///@param arr takes in an array of unsigned Integers
    function ascendingSort(uint256[] memory arr) external pure returns (uint256[] memory) {
        assembly {
            //get where array is stored in memory
            let location := arr

            //get length of array
            let length := mload(arr)

            //loop through array and return the sorted array
            for { let i := 0 } lt(i, length) { i := add(i, 1) } {
                for { let j := add(i, 1) } lt(j, length) { j := add(j, 1) } {
                    if gt(mload(add(add(location, 0x20), mul(0x20, i))), mload(add(add(location, 0x20), mul(0x20, j))))
                    {
                        let z := mload(add(add(location, 0x20), mul(0x20, i)))
                        mstore(add(add(location, 0x20), mul(0x20, i)), mload(add(add(location, 0x20), mul(0x20, j))))
                        mstore(add(add(location, 0x20), mul(0x20, j)), z)
                    }
                }
            }
        }
        return arr;
    }

    ///@dev takes in an array of unsigned Integers and returns the sorted value in descending order
    ///@param arr takes in an array of unsigned Integers
    function descendingSort(uint256[] memory arr) external pure returns (uint256[] memory) {
        assembly {
            //get where array is stored in memory
            let location := arr

            //get length of array
            let length := mload(arr)

            //loop through array and return the sorted array
            for { let i := 0 } lt(i, length) { i := add(i, 1) } {
                for { let j := add(i, 1) } lt(j, length) { j := add(j, 1) } {
                    if lt(mload(add(add(location, 0x20), mul(0x20, i))), mload(add(add(location, 0x20), mul(0x20, j))))
                    {
                        let z := mload(add(add(location, 0x20), mul(0x20, i)))
                        mstore(add(add(location, 0x20), mul(0x20, i)), mload(add(add(location, 0x20), mul(0x20, j))))
                        mstore(add(add(location, 0x20), mul(0x20, j)), z)
                    }
                }
            }
        }
        return arr;
    }

    ///@dev takes in an array of unsigned Integers and returns the index of the element specid
    ///@param arr takes in an array of unsigned Integers
    function indexOf(uint256[] memory arr, uint256 index) external pure returns (uint256 z) {
        assembly {
            //get where array is stored in memory
            let location := arr

            //get length of array
            let length := mload(arr)
            for { let i := 0 } lt(i, length) { i := add(i, 1) } {
                if eq(index, mload(add(add(location, 0x20), mul(0x20, i)))) { z := i }
            }
        }
    }
}
