// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {stdError} from "forge-std/Test.sol";
import {console} from "./utils/Console.sol";
import "../src/stringMethod.sol";

/// @title A test for string operations
contract strings is Test {
    //
    string[] public myArray;

    //this function slice a string
    //in a case where string length is lesser than the sum of end and start, overflow occurs but solidity checks for this already
    function testSlice() public {
        assertEq("universe", stringMethod.slice("universe", 0, 0));
        assertEq("niverse", stringMethod.slice("universe", 1, 0));
        assertEq("univers", stringMethod.slice("universe", 0, 1));
        assertEq("nivers", stringMethod.slice("universe", 1, 1));
        assertEq("ivers", stringMethod.slice("universe", 2, 1));
        assertEq("niver", stringMethod.slice("universe", 1, 2));
        assertEq("iver", stringMethod.slice("universe", 2, 2));
        assertEq("ver", stringMethod.slice("universe", 3, 2));
        assertEq("ive", stringMethod.slice("universe", 2, 3));
        assertEq("ve", stringMethod.slice("universe", 3, 3));
        assertEq("v", stringMethod.slice("universe", 3, 4));
        assertEq("e", stringMethod.slice("universe", 4, 3));
        assertEq("", stringMethod.slice("universe", 4, 4));
    }

    //this function joins two atrings together
    function testConcatenate() public {
        assertEq("at", stringMethod.concatenate("a", "t"));
        assertEq("red", stringMethod.concatenate("r", "ed"));
        assertEq("universe", stringMethod.concatenate("uni", "verse"));
        assertEq("blue whale", stringMethod.concatenate("blue", " whale"));
        assertEq(
            "Why did the chicken cross the road? To get to the other side!",
            stringMethod.concatenate("Why did the chicken cross the road? ", "To get to the other side!")
        );
        assertEq(
            "The first technique for implementing a predictive parser is called recursive-descent. A recursive descent parser consists of several small functions",
            stringMethod.concatenate("The first technique for implementing a predictive parser is called recursive-descent.", " A recursive descent parser consists of several small functions")
        );
    }
}
