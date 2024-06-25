# CustomToken Contract: Minting and Burning Tokens with Error Handling
The `CustomToken` contract in Solidity demonstrates the use of `require`, `revert`, and `assert` statements for error handling. This code helps understand the use of error handling by `require`, `revert`, and `assert` statements in a token contract.

## Description
The `CustomToken` Solidity contract includes minting and burning functions to demonstrate error handling mechanisms. The `mint` function increases the total supply and the balance of the specified address, while the `burn` function decreases them. The `burn` function uses the `require` statement to ensure the specified address has enough balance to burn the tokens. This contract demonstrates how require can be used to validate conditions, ensuring the contract operates correctly and securely.

## Installing
You can see my program on GitHub at - https://github.com/krishnamohan77/ETH_Begning/blob/main/customerToken.sol

## Executing Program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/. Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a `.sol` extension (e.g., CustomToken.sol). Copy and paste the following code into the file:

#### code
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
        require(_amount > 0, "Amount must be greater than zero"); // Ensure the amount is positive
        totalSupply += _amount;
        balances[_to] += _amount;
        emit Mint(_to, _amount);
    }

    // Burn function to decrease the total supply and balance of the specified address
    function burn(address _from, uint256 _amount) public {
        require(balances[_from] >= _amount, "Insufficient balance to burn"); // Ensure the balance is sufficient

        totalSupply -= _amount;
        balances[_from] -= _amount;
        emit Burn(_from, _amount);
    }
}
To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to `0.8.18` (or another compatible version), and then click on the "Compile CustomToken.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the CustomToken contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the mint and burn functions. These functions will demonstrate the use of require statements for error handling according to the conditions specified in the program.

## Authors
KRISHNA MOHAN SWARNKAR
Gmail- krishnamohank291@gmail.com

## License
This project is licensed under the MIT License - see the LICENSE.md file for details.

