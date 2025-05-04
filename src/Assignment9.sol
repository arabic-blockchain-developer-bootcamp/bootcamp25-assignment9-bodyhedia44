// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.9/contracts/access/Ownable.sol";

// inherit from Ownable contract
contract Assignment9 is Ownable {
    // create a public array called `deployedContracts` to store contracts addresses in it
    address[] public deployedContracts;

    // call Ownable constructor of openzeppelin contract
    constructor() Ownable() {

    }

    // @dev Factory to deploy new instances of `SimpleContract`
    // make only the owner is the one who can call this function
    function createContract(uint256 _initialValue) external onlyOwner {
        // deploy new instance of SimpleContract
        SimpleContract newContract = new SimpleContract(_initialValue);

        // push the new deployed instance to deployedContracts array
        deployedContracts.push(address(newContract));
    }
}

// Simple contract to be deployed by the factory
contract SimpleContract {
    uint256 public value;

    constructor(uint256 _initialValue) {
        value = _initialValue;
    }

    function setValue(uint256 newValue) external {
        value = newValue;
    }
}
