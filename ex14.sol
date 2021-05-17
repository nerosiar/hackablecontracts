pragma solidity ^0.8.0;

contract PiggyBank {

    address owner;

    /// @dev Set msg.sender as owner
    constructor() {
        owner = msg.sender;
    }

    /// @dev Deposit 1 ETH in the smart contract
    function deposit() public payable {
        require(msg.sender == owner && msg.value == 1 ether && address(this).balance <= 10 ether);
    }

    /// @dev Withdraw the entire smart contract balance
    function withdrawAll() public {
        require(msg.sender == owner && address(this).balance == 10 ether);
        payable(owner).send(address(this).balance);
    }
}
