// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract ErrorTriageExercise {
    uint[] arr;
    
    // util function
    function abs(int x) internal pure returns (uint) {
        return uint(x >= 0 ? x : -x);
    }

    /**
     * Finds the difference between each uint with it's neighbor (a to b, b to c, etc.)
     * and returns a uint array with the absolute integer difference of each pairing.
     */
    function diffWithNeighbor(
        uint _a,
        uint _b,
        uint _c,
        uint _d
    ) public pure returns (uint[] memory) {
        // Initialize an array to store the differences
        uint[] memory results = new uint[](3);

        // Calculate the absolute difference between each pair of integers and store it in the results array
        results[0] = _a > _b ? _a - _b : _b - _a;
        results[1] = _b > _c ? _b - _c : _c - _b;
        results[2] = _c > _d ? _c - _d : _d - _c;

        // Return the array of differences
        return results;
    }

    /**
     * Changes the _base by the value of _modifier.  Base is always >= 1000.  Modifiers can be
     * between positive and negative 100;
     */
    function applyModifier(
        uint _base,
        int _modifier
    ) public pure returns (uint) {
        assert(_base >= 1000);
        assert(_modifier >= -100 && _modifier <= 100);
        
        int modifiedValue = int(_base) + _modifier;
        return uint(modifiedValue);
    }

    /**
     * Pop the last element from the supplied array, and return the popped
     * value (unlike the built-in function)
     */
    function popWithReturn() public returns (uint) {
        require(arr.length > 0, "Array is empty");
        uint index = arr.length - 1;
        uint value = arr[index];
        arr.pop();
        return value;
    }

    // The utility functions below are working as expected
    function addToArr(uint _num) public {
        arr.push(_num);
    }

    function getArr() public view returns (uint[] memory) {
        return arr;
    }

    function resetArr() public {
        delete arr;
    }
}
