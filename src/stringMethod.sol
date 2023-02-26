// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

library stringMethod {
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
}
