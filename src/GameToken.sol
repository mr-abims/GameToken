// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract GameToken is ERC20 {
    string[] public gameItems;
    mapping(string => bool) public itemExists;
    mapping(string => address) public itemOwner;
    address public owner = msg.sender;
    event Redeemed(address indexed user, string itemId, uint256 amount);

    constructor() ERC20("DEGEN", "DGN") {}

    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "ERC20: Only owner can call this function."
        );
        _;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function addGameItem(string memory itemId) public onlyOwner {
        require(!itemExists[itemId], "Item already exists");
        gameItems.push(itemId);
        itemExists[itemId] = true;
        itemOwner[itemId] = msg.sender;
    }

    function redeem(string memory itemId, uint256 amount) public {
        require(itemExists[itemId], "Item does not exist");
        require(
            balanceOf(msg.sender) >= amount,
            "ERC20: redeem amount exceeds balance"
        );
        _burn(msg.sender, amount);
        emit Redeemed(msg.sender, itemId, amount);
    }

    function sendGameItem(address to, string memory itemId) public {
        require(itemExists[itemId], "Item does not exist");
        require(itemOwner[itemId] == msg.sender, "You do not own this item");
        itemOwner[itemId] = to;
    }

    function getGameItems() public view returns (string[] memory) {
        return gameItems;
    }

    function burn(uint256 _amount) public {
        require(
            balanceOf(msg.sender) >= _amount,
            "ERC20: burn amount exceeds balance"
        );
        _burn(msg.sender, _amount);
    }
}
