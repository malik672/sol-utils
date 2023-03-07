// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

library Methods {
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

    ///@dev takes in array an array and a function and return a the filtered item in a new array
    ///@param arr takes in array of unsigned Integers
    ///@param func takes in a func as a parameter
    function filter(uint256[] memory arr, function(uint256) external pure func) external pure returns (uint256 z) {
        assembly {
            //get where array is stored in array
            let location := arr

            //get length of array
            let length := mload(arr)

            //
        }
    }

    // inserts element into array at index
    function insert(uint256[] memory arr, uint256 newVal, uint256 index) public pure returns (uint256[] memory) {
        assembly {
            // where array is stored in memory
            let location := arr
            // length of array is stored at arr
            let length := mload(arr)
            // gets next available memory location
            let nextMemoryLocation := add(add(location, 0x20), mul(length, 0x20))

            // fre memory pointer
            let freeMem := mload(0x40)
            // advance msize()
            let newMsize := add(freeMem, 0x20)

            // location we want to insert element
            let targetLocation := add(add(location, 0x20), mul(index, 0x20))

            let currVal
            let prevVal
            for { let i := targetLocation } lt(i, newMsize) { i := add(i, 0x20) } {
                currVal := mload(i)
                mstore(i, prevVal)
                prevVal := currVal
            }
            // stores new value to memory
            mstore(targetLocation, newVal)
            // increment length by 1
            length := add(length, 1)
            // store new length value
            mstore(location, length)
            // update free memory pointer
            mstore(0x40, newMsize)
        }
        return arr;
    }

    // removes element from array at index
    function remove(uint256[] memory arr, uint256 index) public pure returns (uint256[] memory) {
        assembly {
            // where array is stored in memory
            let location := arr
            // length of array is stored at arr
            let length := mload(arr)
            // free memory pointer
            let freeMemPntr := mload(0x40)
            // location of element being removed
            let targetLocation := add(add(location, 0x20), mul(index, 0x20))
            for { let i := targetLocation } lt(i, freeMemPntr) { i := add(i, 0x20) } {
                let nextVal := mload(add(i, 0x20))
                mstore(i, nextVal)
            }
            length := sub(length, 1)
            mstore(location, length)
        }
        return arr;
    }

    //replace a value in the array with another
    function replace(uint[] memory arr, uint index, uint value) pure public returns(uint[] memory){
        assembly{
            let location := arr
            let length := mload(arr)
            mstore(add(add(0x20, location), mul(index, 0x20)), value)
            mstore(0x00, location)
            return(0x00, mload(0x40))
        }
    }
}
