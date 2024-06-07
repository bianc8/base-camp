// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.19;

contract BasicMath {
    uint256 number;

    /*
    A function called adder. It must:
        Accept two uint arguments, called _a and _b
        Return a uint sum and a bool error
        If _a + _b do not overflow, it should return the sum and an error of false
        If _a + _b overflow, it should return 0 as the sum, and an error of true
    */
    function adder(uint _a, uint _b) public pure returns (uint256, bool) {
        if (_a == type(uint).max || _b == type(uint).max) return (0, true);

        uint sum = _a + _b;
        bool ok = sum >= _a && sum >= _b;
        if (!ok) return (0, true);
        return (sum, false);
    }

    /*
    Subtractor
    A function called subtractor. It must:
        Accept two uint arguments, called _a and _b
        Return a uint difference and a bool error
        If _a - _b does not underflow, it should return the difference and an error of false
        If _a - _b underflows, it should return 0 as the difference, and an error of true
    */
    function subtractor(
        uint256 _a,
        uint256 _b
    ) public pure returns (uint256, bool) {
        bool ok = _b <= _a;
        if (!ok) return (0, true);
        uint256 sum = _a - _b;
        return (sum, false);
    }
}
