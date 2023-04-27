// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

library Math {
    /*//////////////////////////////////////////////////////////////
                                  PROPERTIES
    //////////////////////////////////////////////////////////////*/

    /// @return z uint256 euler number
    function E() internal pure returns (uint256 z) {
        assembly {
            z := 2718281828459045235
        }
    }

    /// @return z uint256 natural logarithm of 10
    function LN10() internal pure returns (uint256 z) {
        assembly {
            z := 2302585092994046
      
        }
    }

    /// @return z uint256 natural logarithm of 2
    function LN2() internal pure returns (uint256 z) {
        assembly {
            z := 0xF0E1D7341A74C5
        }
    }

    /// @return z uint256 base 10 logarithm of euler number
    function L0G10E() internal pure returns (uint256 z) {
        assembly {
            z := 0x97A15D47F734F6
        }
    }

    /// @return z uint256 base 2 logarithm of euler number
    function L0G2E() internal pure returns (uint256 z) {
        assembly {
            z := 14426950408889634
        }
    }

    /// @return z uint256 constant PI
    function PI() internal pure returns (uint256 z) {
        assembly {
            z := 3141592653589793
        }
    }

    /// @return z uint256 the square root of 1/2
    function SQRT1_2() internal pure returns (uint256 z) {
        assembly {
            z := 7071067811865476
        }
    }

    /// @return z uint256 the square root of 2
    function SQRT2() internal pure returns (uint256 z) {
        assembly {
            z := 14142135623730951
        }
    }

    /*//////////////////////////////////////////////////////////////
                                  METHODS
    //////////////////////////////////////////////////////////////*/

    function ABS(int256 x) internal pure returns (uint256 z) {
        assembly {
            if iszero(and(x, 0x80000000)) {
                z := x
            }
            z := add(not(x), 1)
        }
    }

    // function ACOS(int256 x) internal pure returns (uint256) {
    //     assembly {
    //         let xs := PI()
    //     }
    // }
}
