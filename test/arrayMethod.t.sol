// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {stdError} from "forge-std/Test.sol";
import {console} from "./utils/Console.sol";
import "../src/arrayMethod.sol";

/// @title A test for array methods
contract array is Test {
    //
    uint256[] public myArray;

    //in a case where we get the minimum number in an array
    function testMin() public returns (uint256) {
        myArray.push(300 ether);
        myArray.push(200 ether);
        myArray.push(100 ether);
        assertEq(100 ether, arrayMethods.min(myArray));
    }

    //in this case it arranges the element array from the smallest to the biggest
    function testAscendingSort() public returns (uint256) {
        myArray.push(300 ether);
        myArray.push(200 ether);
        myArray.push(400 ether);
        myArray.push(100 ether);
        myArray.push(800 ether);
        myArray.push(20 ether);
        arrayMethods.ascendingSort(myArray);
    }

    //in this case it arranges the element array from the biggest to the smallet
    function testDescendingSort() public returns (uint256) {
        myArray.push(300 ether);
        myArray.push(200 ether);
        myArray.push(400 ether);
        myArray.push(100 ether);
        myArray.push(800 ether);
        myArray.push(20 ether);
        arrayMethods.descendingSort(myArray);
    }

    //in this case it arranges the element array from the biggest to the smallet
    function testIndexOf() public returns (uint256) {
        myArray.push(300 ether);
        myArray.push(200 ether);
        myArray.push(400 ether);
        myArray.push(100 ether);
        myArray.push(800 ether);
        myArray.push(20 ether);
        arrayMethods.descendingSort(myArray);
    }
}
