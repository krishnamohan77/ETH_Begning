// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract CustomToken {

    // Public variables to store the details about the coin
    string public tokenName = "CustomToken";
    string public tokenSymbol = "CTK";
    uint256 public totalSupply = 0;

    // Mapping to store balances of addresses
    mapping(address => uint256) public balances;

    // Event to log minting actions
    event Mint(address indexed to, uint256 value);

    // Event to log burning actions
    event Burn(address indexed from, uint256 value);

    // Mint function to increase the total supply and balance of the specified address
    function mint(address _to, uint256 _amount) public {
        totalSupply += _amount;
        balances[_to] += _amount;
        emit Mint(_to, _amount);
    }

    // Burn function to decrease the total supply and balance of the specified address
    function burn(address _from, uint256 _amount) public {
        require(balances[_from] >= _amount, "Insufficient balance to burn");

        totalSupply -= _amount;
        balances[_from] -= _amount;
        emit Burn(_from, _amount);
    }
}
