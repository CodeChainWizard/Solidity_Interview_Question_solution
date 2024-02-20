
/* Question 2

SafeMath is a commonly used library in solidity to prevent vulnerabilities associated with arithmetic operation is smart contracts.
In the context of SafeMath, discuss the signification of the sub function an its role is secure contract developments,
why is it crucial to use sub when performing subtraction operations with unsigned integers (uint256)? Additionally,
explain the purpose of the error message "SafeMath: sunstract overflow" and how it contribustions to the contract security.
Can you provide an example scenario where the absence of SafeMath is subtractions could lead to vulnerabilities in the smart
contract.


---> Important Points
    (1) Safe Subtraction.
    (2) Error Message on UnderFlow.
    (3) Revert on UnderFlow.
    (4) Secure Contract Development
*/


// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

library SafeMath{
    function sub(uint256 a, uint256 b) public pure returns (uint256){
        return sub(a, b, "SafeMath: substraction overflow");
    }

    function sub(uint256 a, uint256 b, string memory errorMsg) internal pure returns (uint256){
        require(b <= a, errorMsg);
        uint256 c = a-b;
        return c;
    }
}


contract SubContract {
    using SafeMath for uint256;

    function safeSub(uint256 x, uint256 y) public pure returns (uint256){
        return x.sub(y);
    }
}


// When this lib is not use then show an this type of problem.
contract withOutSub{
    uint256 balance = 100; // token balance

    function safeSub(uint256 x) public view returns (uint256) {
        // Substract without safe hb using..
        uint256 newBalance = balance - x;
        return newBalance;
    }
}

