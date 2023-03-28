// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

library Math {
    /*//////////////////////////////////////////////////////////////
                                  PROPERTIES
    //////////////////////////////////////////////////////////////*/

    /// @return uint256 euler number
    function E() internal pure returns (uint256) {
        assembly {
            let Euler := 2718281828459045235
            mstore(0x0, Euler)
            return(0x00, 0x20)
        }
    }

    /// @return uint256 natural logarithm of 10
    function LN10() internal pure returns (uint256) {
        assembly {
            let log := 2302585092994046
            mstore(0x0, log)
            return(0x00, 0x20)
        }
    }

    /// @return uint256 natural logarithm of 2
    function LN2() internal pure returns (uint256) {
        assembly {
            let log := 0xF0E1D7341A74C5
            mstore(0x0, log)
            return(0x00, 0x20)
        }
    }

    /// @return uint256 base 10 logarithm of euler number
    function L0G10E() internal pure returns (uint256) {
        assembly {
            let log := 0x97A15D47F734F6
            mstore(0x0, log)
            return(0x00, 0x20)
        }
    }

    /// @return uint256 base 2 logarithm of euler number
    function L0G2E() internal pure returns (uint256) {
        assembly {
            let log := 14426950408889634
            mstore(0x0, log)
            return(0x00, 0x20)
        }
    }

    /// @return uint256 constant PI
    function PI() internal pure returns (uint256) {
        assembly {
            let pi := 3141592653589793
            mstore(0x0, pi)
            return(0x00, 0x20)
        }
    }

    /// @return uint256 the square root of 1/2
    function SQRT1_2() internal pure returns (uint256) {
        assembly {
            let sqrt1_2 := 7071067811865476
            mstore(0x0, sqrt1_2)
            return(0x00, 0x20)
        }
    }

    /// @return uint256 the square root of 2
    function SQRT2() internal pure returns (uint256) {
        assembly {
            let sqrt2 := 14142135623730951
            mstore(0x0, sqrt2)
            return(0x00, 0x20)
        }
    }

    /*//////////////////////////////////////////////////////////////
                                  METHODS
    //////////////////////////////////////////////////////////////*/

    function ABS(int256 x) internal pure returns (uint256) {
        assembly {
            if iszero(and(x, 0x80000000)) {
                mstore(0x0, x)
                return(0x0, 0x20)
            }
            mstore(0x00, add(not(x), 1))
            return(0x00, 0x20)
        }
    }

    // function ACOS(int256 x) internal pure returns (uint256) {
    //     assembly {
    //         let xs := PI()
    //     }
    // }
}
