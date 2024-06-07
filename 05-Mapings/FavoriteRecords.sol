// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FavoriteRecords {
    // State Variables
    mapping(string => bool) public approvedRecords;
    mapping(address => mapping(string => bool)) public userFavorites;

    // Custom Error
    error NotApproved(string albumName);

    // Constructor to initialize approvedRecords
    constructor() {
        approvedRecords["Thriller"] = true;
        approvedRecords["Back in Black"] = true;
        approvedRecords["The Bodyguard"] = true;
        approvedRecords["The Dark Side of the Moon"] = true;
        approvedRecords["Their Greatest Hits (1971-1975)"] = true;
        approvedRecords["Hotel California"] = true;
        approvedRecords["Come On Over"] = true;
        approvedRecords["Rumours"] = true;
        approvedRecords["Saturday Night Fever"] = true;
    }

    // Function to get the list of all approved records
    function getApprovedRecords() public pure returns (string[] memory) {
        string[] memory records = new string[](9);
        records[0] = "Thriller";
        records[1] = "Back in Black";
        records[2] = "The Bodyguard";
        records[3] = "The Dark Side of the Moon";
        records[4] = "Their Greatest Hits (1971-1975)";
        records[5] = "Hotel California";
        records[6] = "Come On Over";
        records[7] = "Rumours";
        records[8] = "Saturday Night Fever";
        return records;
    }

    // Function to add a record to user's favorites if it is approved
    function addRecord(string memory albumName) public {
        if (!approvedRecords[albumName]) {
            revert NotApproved(albumName);
        }
        userFavorites[msg.sender][albumName] = true;
    }

    // Function to get the list of user's favorite records
    function getUserFavorites(address user) public view returns (string[] memory) {
        string[] memory temp = new string[](9);
        uint count = 0;
        if (userFavorites[user]["Thriller"]) {
            temp[count] = "Thriller";
            count++;
        }
        if (userFavorites[user]["Back in Black"]) {
            temp[count] = "Back in Black";
            count++;
        }
        if (userFavorites[user]["The Bodyguard"]) {
            temp[count] = "The Bodyguard";
            count++;
        }
        if (userFavorites[user]["The Dark Side of the Moon"]) {
            temp[count] = "The Dark Side of the Moon";
            count++;
        }
        if (userFavorites[user]["Their Greatest Hits (1971-1975)"]) {
            temp[count] = "Their Greatest Hits (1971-1975)";
            count++;
        }
        if (userFavorites[user]["Hotel California"]) {
            temp[count] = "Hotel California";
            count++;
        }
        if (userFavorites[user]["Come On Over"]) {
            temp[count] = "Come On Over";
            count++;
        }
        if (userFavorites[user]["Rumours"]) {
            temp[count] = "Rumours";
            count++;
        }
        if (userFavorites[user]["Saturday Night Fever"]) {
            temp[count] = "Saturday Night Fever";
            count++;
        }

        string[] memory favorites = new string[](count);
        for (uint i = 0; i < count; i++) {
            favorites[i] = temp[i];
        }

        return favorites;
    }

    // Function to reset the sender's favorite records
    function resetUserFavorites() public {
        string[9] memory approved = [
            "Thriller", "Back in Black", "The Bodyguard", "The Dark Side of the Moon",
            "Their Greatest Hits (1971-1975)", "Hotel California", "Come On Over",
            "Rumours", "Saturday Night Fever"
        ];
        
        for (uint i = 0; i < approved.length; i++) {
            if (userFavorites[msg.sender][approved[i]]) {
                delete userFavorites[msg.sender][approved[i]];
            }
        }
    }
}
