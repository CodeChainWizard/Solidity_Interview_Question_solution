// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

// In the context of solidity and amart contract development, the SafeMath library includes a function named multiple designed for secure multiplication
// Of unsigned integers(uint256). Explain the purpose and significance of using the multiple function in SafeMath, What risks does it address, particularly
// Realted to arithmetic overflow, and how does it contributes to the overall security of smart contracts? Provide an example scenario where the absences of SafrMath in multiplication operations could lead to vulnerabilities, and elaborated on how the mul function helps mitigate such ricks.

// —> IMPORTANT POINT
// 	(1) Safe Multiplication.
// 	(2) Handling Zero Input.
// 	(3) Overflow Check.
// 	(4) Revert on Overflow.

library SafeMath {
    function mul(uint256 a, uint256 b) public pure returns (uint256){
        if(a == 0){
            return 0;
        }

        uint256 c = a * b;
        require(c/a == b, "SafeMath: multiplication Overflow");
        return c;
    }
}

contract MultiplyContract {
    using SafeMath for uint256;

    function SafeMul(uint256 x, uint256 y) public pure returns (uint256){
        return x.mul(y);
    }
}

// When you don't using SafeMath Lin then facing this type of error(problem). PART-2

library UseSafeMath{
    function unSafeMathMul(uint256 a, uint256 b) public pure returns (uint256){
        uint256 c = a * b;
        return c;
    }
}

contract MultiplicationWithOutSafeMath{
    using UseSafeMath for uint256;

    function WithOutSafeMath(uint256 x, uint256 y) public pure returns (uint256){
        return x.unSafeMathMul(y);
    }

    function exampleUsage() public pure returns (uint256){
        uint256 a = 2**255; // Large value containes
        uint256 b = 3;

        // This multiplication will result in an overflow
        uint256 res = a * b;
        return  res;
    }
}