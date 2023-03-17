# Sol-array
Bunch of random shit in solidity
## StringMethod Library
This is a Solidity library that provides various methods for working with strings. The library contains the following functions:

**Concatenate**:
This function joins two strings together.

**Usage**

```solidity
// import
import  "./stringMethod.sol";

contract MyContract {

    function joinThestrings(string memory a, string memory b) public pure returns (string memory) {

        return stringMethod.concatenate(a, b);

    }

}

```
**Matches**:
This function checks an array of strings return 1 if present else 0.

**Usage**

```solidity
// import
import "./stringMethod.sol";

contract MyContract {

    function matchTheString(string[] memory arr, string memory check) public pure returns (uint256) {

        return stringMethod.matches(arr, check);

    }

}
```
**Slice**:
This function slice and return the sliced string.

**Usage**

```solidity
// import
import { stringMethod } from "./stringMethod.sol";

contract MyContract {

    function sliceTheString(uint256 start, uint256 end) public pure returns (string memory){

        return stringMethod.slice(start,end);

    }

}
```
 **NOTE**: This methods modify the original string in memory, once you use them they strings no longer exist
