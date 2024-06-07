// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.19;

contract ArraysExercise {
    uint[] public numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    address[] public senders;
    uint[] public timestamps;

    // Function to return the entire numbers array
    function getNumbers() public view returns (uint[] memory) {
        return numbers;
    }

    // Function to reset the numbers array to its initial values
    function resetNumbers() public {
        // Reset the array directly without using push() for gas efficiency
        numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    }

    // Function to append a calldata array to the numbers array
    function appendToNumbers(uint[] calldata _toAppend) public {
        uint length = _toAppend.length;
        for (uint i = 0; i < length; i++) {
            numbers.push(_toAppend[i]);
        }
    }

    // Function to save the timestamp and the caller's address
    function saveTimestamp(uint _unixTimestamp) public {
        senders.push(msg.sender);
        timestamps.push(_unixTimestamp);
    }

    // Function to return timestamps and addresses after January 1, 2000
    function afterY2K() public view returns (uint[] memory, address[] memory) {
        uint count = 0;
        uint length = timestamps.length;

        // Count how many timestamps are after Y2K
        for (uint i = 0; i < length; i++) {
            if (timestamps[i] > 946702800) {
                count++;
            }
        }

        // Initialize arrays with the correct size
        uint[] memory recentTimestamps = new uint[](count);
        address[] memory recentSenders = new address[](count);
        uint index = 0;

        // Populate the arrays with data after Y2K
        for (uint i = 0; i < length; i++) {
            if (timestamps[i] > 946702800) {
                recentTimestamps[index] = timestamps[i];
                recentSenders[index] = senders[i];
                index++;
            }
        }

        return (recentTimestamps, recentSenders);
    }

    // Function to reset the senders array
    function resetSenders() public {
        delete senders;
    }

    // Function to reset the timestamps array
    function resetTimestamps() public {
        delete timestamps;
    }
}
