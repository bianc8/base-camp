// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.19;

contract EmployeeStorage {
    /*
    State Variables
The contract should have the following state variables, optimized to minimize storage:
    A private variable shares storing the employee's number of shares owned
        Employees with more than 5,000 shares count as directors and are stored in another contract
    Public variable name which stores the employee's name
    A private variable salary storing the employee's salary
        Salaries range from 0 to 1,000,000 dollars
    A public variable idNumber storing the employee's ID number
        Employee numbers are not sequential, so this field should allow any number up to 2^256-1*/
    uint16 private shares; // 2 bytes
    uint32 private salary; // 4 bytes
    uint256 public idNumber; // 32 bytes
    string public name; // dynamically sized, stored in separate storage slots

    // custom error
    error TooManyShares(uint16 totalShares);

    /* When deploying the contract, utilize the constructor to set: shares, name, salary, idNumber*/
    constructor(uint16 _shares, string memory _name, uint32 _salary, uint _id) {
        shares = _shares;
        name = _name;
        salary = _salary;
        idNumber = _id;
    }

    // Write a function called viewSalary that returns the value in salary.
    function viewSalary() public view returns (uint32) {
        return salary;
    }

    // Write a function called viewShares that returns the value in shares.
    function viewShares() public view returns (uint16) {
        return shares;
    }

    /*Grant Shares
        Add a public function called grantShares that increases the number of shares allocated to an employee by _newShares. It should:

        Add the provided number of shares to the shares
        If this would result in more than 5000 shares, revert with a custom error called TooManyShares that returns the number of shares the employee would have with the new amount added
        If the number of _newShares is greater than 5000, revert with a string message, "Too many shares" */
    function grantShares(uint16 _newShares) public {
        if (_newShares > 5000) revert("Too many shares");
        uint16 sum = shares + _newShares;
        if (sum > 5000) {
            revert TooManyShares(sum);
        }
        shares = sum;
    }

    // Add the following function to your contract exactly as written below.
    /**
     * Do not modify this function.  It is used to enable the unit test for this pin
     * to check whether or not you have configured your storage variables to make
     * use of packing.
     *
     * If you wish to cheat, simply modify this function to always return `0`
     * I'm not your boss ¯\_(ツ)_/¯
     *
     * Fair warning though, if you do cheat, it will be on the blockchain having been
     * deployed by your wallet....FOREVER!
     */
    function checkForPacking(uint _slot) public view returns (uint r) {
        assembly {
            r := sload(_slot)
        }
    }

    /**
     * Warning: Anyone can use this function at any time!
     */
    function debugResetShares() public {
        shares = 1000;
    }
}
