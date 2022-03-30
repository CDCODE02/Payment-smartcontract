// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;


contract Payable {
    // Payable address can receive Ether
    address payable public owner;
    
    // Payable constructor can receive Ether
    constructor() payable {
        owner = payable(address(msg.sender));
    }

    receive() external payable {
    }

    // Function to withdraw all Ether from this contract.
    function withdraw() public {
        // get the amount of Ether stored in this contract
        uint256 amount = (address(this)).balance;

        // send all Ether to owner
        // Owner can receive Ether since the address of owner is payable
        bool sent = owner.send(amount);
        require(sent, "Failed to send Ether");
    }

    // Function to transfer Ether from this contract to address from input
    function transfer(address payable _to, uint _amount) public {
        // get the amount of Ether stored in this contract
        uint256 amount = address(this).balance;
        require(amount > _amount, "You cant pay more money than you hold");
        
        // send all Ether to owner
        // Owner can receive Ether since the address of owner is payable
        bool sent = _to.send(amount);
        require(sent, "Failed to send Ether");
    }
}