Introduction
This smart contract, named 'CustomToken', is a simple representation of a token system on the Ethereum blockchain. It allows the creation (minting) and destruction (burning) of tokens, as well as tracking the balances of different addresses.

 License and Version Declaration
solidity
Copy code
// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
SPDX License Identifier: Indicates that this code is licensed under the MIT License.
Pragma Directive: Specifies the Solidity compiler version 0.8.18, ensuring compatibility with this version.
2. Contract Definition
solidity
Copy code
contract CustomToken {
Contract Declaration: Defines the CustomToken contract.
3. Public Variables
solidity
Copy code
    string public tokenName = "CustomToken";
    string public tokenSymbol = "CTK";
    uint256 public totalSupply = 0;
tokenName: Stores the name of the token, "CustomToken".
tokenSymbol: Stores the symbol of the token, "CTK".
totalSupply: Tracks the total supply of tokens in existence, initially set to 0.
4. Mapping to Store Balances
solidity
Copy code
    mapping(address => uint256) public balances;
balances: A mapping from addresses to their token balances. It allows us to look up the balance of any address.
5. Events
solidity
Copy code
    event Mint(address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);
Mint Event: Logs the minting of new tokens. It records the recipient’s address and the amount of tokens minted.
Burn Event: Logs the burning of tokens. It records the address from which tokens were burned and the amount.
6. Mint Function
solidity
Copy code
    function mint(address _to, uint256 _amount) public {
        totalSupply += _amount;
        balances[_to] += _amount;
        emit Mint(_to, _amount);
    }
mint: Allows the creation of new tokens.
Parameters:
_to: The address receiving the new tokens.
_amount: The number of tokens to be minted.
Functionality:
Increases totalSupply by the _amount.
Increases the balance of the _to address by the _amount.
Emits the Mint event to log this action.
7. Burn Function
solidity
Copy code
    function burn(address _from, uint256 _amount) public {
        require(balances[_from] >= _amount, "Insufficient balance to burn");

        totalSupply -= _amount;
        balances[_from] -= _amount;
        emit Burn(_from, _amount);
    }
burn: Allows the destruction of existing tokens.
Parameters:
_from: The address from which tokens will be burned.
_amount: The number of tokens to be burned.
Functionality:
Checks if the _from address has enough tokens to burn using require.
Decreases totalSupply by the _amount.
Decreases the balance of the _from address by the _amount.
Emits the Burn event to log this action.
