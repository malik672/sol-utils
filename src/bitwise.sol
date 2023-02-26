// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

library Bits {
    function msb(uint256 x) public pure returns (uint256) {
        uint256 msbs;
        assembly {
            msbs := 0x80000000000000000000000000000000 // declare the mask
            msbs := and(x, msbs) // perform bitwise AND between x and the mask
            if iszero(msbs) {
                // check if the result is zero
                msbs := 0 // assign zero to msb
                mstore(0x80, msbs) // store msb at memory location 0x80
                return(0x80, 0x20) // return msb from memory location 0x80 with size 0x20 bytes
            }
            msbs := 1 // assign one to msb mstore(0x80,msb) // store msb at memory location 0x80 basically the free memory
            return(0x80, 0x20) // return msb from memory location 0x80 with size 0x20 bytes
        }
    }
}
