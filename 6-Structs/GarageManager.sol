// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GarageManager {
    // Struct to represent a car
    struct Car {
        string make;
        string model;
        string color;
        uint numberOfDoors;
    }

    // Mapping from user address to a list of cars
    mapping(address => Car[]) public garage;

    // Custom Error for bad car index
    error BadCarIndex(uint index);

    // Function to add a car to the user's garage
    function addCar(string memory make, string memory model, string memory color, uint numberOfDoors) public {
        Car memory newCar = Car(make, model, color, numberOfDoors);
        garage[msg.sender].push(newCar);
    }

    // Function to get all cars owned by the calling user
    function getMyCars() public view returns (Car[] memory) {
        return garage[msg.sender];
    }

    // Function to get all cars owned by any user
    function getUserCars(address user) public view returns (Car[] memory) {
        return garage[user];
    }

    // Function to update a car's details
    function updateCar(uint index, string memory make, string memory model, string memory color, uint numberOfDoors) public {
        if (index >= garage[msg.sender].length) {
            revert BadCarIndex(index);
        }
        garage[msg.sender][index] = Car(make, model, color, numberOfDoors);
    }

    // Function to reset the caller's garage
    function resetMyGarage() public {
        delete garage[msg.sender];
    }
}
