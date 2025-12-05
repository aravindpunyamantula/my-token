// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title MyToken - A simple ERC-20 compatible token for learning
contract MyToken {

    // Token metadata (public so Remix shows getters automatically)

    string public name = "MyToken";
    string public symbol = "MTK";
    uint8 public decimals = 18;


    // Token supply & balances

    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;


    // Allowances: owner => (spender => amount)

    mapping(address => mapping(address => uint256)) public allowance;


    // Events (required by ERC-20)

    // Emitted when tokens are transferred
    event Transfer(address indexed from, address indexed to, uint256 value);

    // Emitted when allowance is set/updated
    event Approval(address indexed owner, address indexed spender, uint256 value);


    // Constructor

    /// @notice Mints the initial supply to the deployer
    /// @param _initialSupply Initial supply in smallest units (e.g. 1e6 * 1e18)
    constructor(uint256 _initialSupply) {
        totalSupply = _initialSupply;

        // Give all tokens to the account that deploys the contract
        balanceOf[msg.sender] = _initialSupply;

        // Emit Transfer from "zero address" to show minting in logs
        emit Transfer(address(0), msg.sender, _initialSupply);
    }


    // Core ERC-20 functions

    /// @notice Transfer tokens from caller to another address
    /// @param _to Recipient address
    /// @param _value Amount to transfer
    /// @return success True if transfer succeeded
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0), "Cannot transfer to zero address");
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");

        // Update balances
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        // Emit event
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    /// @notice Approve another address to spend your tokens
    /// @param _spender Address allowed to spend
    /// @param _value Max amount they can spend
    /// @return success True if approval succeeded
    function approve(address _spender, uint256 _value) public returns (bool success) {
        require(_spender != address(0), "Cannot approve zero address");

        // Set allowance
        allowance[msg.sender][_spender] = _value;

        // Emit event
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    /// @notice Transfer tokens on behalf of an owner using allowance
    /// @param _from Address to send tokens from
    /// @param _to Recipient address
    /// @param _value Amount to transfer
    /// @return success True if transfer succeeded
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0), "Cannot transfer to zero address");
        require(balanceOf[_from] >= _value, "Insufficient balance");
        require(allowance[_from][msg.sender] >= _value, "Insufficient allowance");

        // Update balances
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        // Decrease allowance
        allowance[_from][msg.sender] -= _value;

        // Emit event
        emit Transfer(_from, _to, _value);
        return true;
    }


    // Helper / convenience functions

    /// @notice Returns the total token supply
    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    /// @notice Returns basic token information in one call
    function getTokenInfo()
        public
        view
        returns (string memory, string memory, uint8, uint256)
    {
        return (name, symbol, decimals, totalSupply);
    }
}
