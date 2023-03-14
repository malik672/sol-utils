// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {stdError} from "forge-std/Test.sol";
import {console} from "./utils/Console.sol";
import {stringMethod} from "../src/stringMethod.sol";

/// @title A test for string operations
contract strings is Test {
    function testMatches(string[] memory a, string calldata b) public {
        assertEq(1, stringMethod.matches(a, b));
    }
}
