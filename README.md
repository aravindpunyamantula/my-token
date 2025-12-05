# MyToken (MTK) – ERC-20 Token

## Overview
MyToken (MTK) is a beginner-friendly ERC-20 token created using Solidity.  
This project demonstrates how ERC-20 tokens work on Ethereum, including  
balance management, transfers, approvals, delegated transfers, and events.

This token was implemented as part of the Partnr Blockchain module.

---

## Token Details
| Property | Value |
|---------|--------|
| **Name** | MyToken |
| **Symbol** | MTK |
| **Decimals** | 18 |
| **Total Supply** | 1,000,000 MTK (minted to deployer) |
| **Standard** | ERC-20 |

Total supply in smallest units (wei-like unit):  
`1000000000000000000000000`

---

## What is an ERC-20 Token?
ERC-20 is a smart-contract standard on Ethereum that defines how tokens must behave.  
Implementing this standard ensures:

- Interoperability with wallets and exchanges  
- Consistent function names (`transfer`, `approve`, `transferFrom`, etc.)  
- Event transparency (`Transfer`, `Approval`)  
- Predictable behavior for all token holders  

Thousands of tokens — USDT, LINK, SHIB — follow ERC-20 rules.

---

## Implemented Features
✔️ Metadata (name, symbol, decimals)  
✔️ Total supply creation in constructor  
✔️ balanceOf (address → uint256)  
✔️ transfer(to, amount)  
✔️ approve(spender, amount)  
✔️ transferFrom(from, to, amount)  
✔️ allowance(owner, spender)  
✔️ Emits Transfer and Approval events  
✔️ Zero-address validation  
✔️ Insufficient balance checks  
✔️ Insufficient allowance checks  

---

## Deployment Instructions (Remix IDE)

1. Open **https://remix.ethereum.org**
2. Create a file: `contracts/MyToken.sol`
3. Paste the Solidity code
4. Compile using **Solidity 0.8.x**
5. Go to **Deploy & Run Transactions**
6. Environment → **Remix VM**
7. In constructor input enter:

```
1000000000000000000000000
```

8. Click **Deploy**

---

## Usage Examples

### ✔️ Check Balance
```solidity
balanceOf(0xYourAddress)
```

### ✔️ Transfer Tokens
```solidity
transfer(0xRecipient, 1000000000000000000) // 1 MTK
```

### ✔️ Approve Spender
```solidity
approve(0xSpender, 5000000000000000000) // 5 MTK
```

### ✔️ Delegated Transfer (transferFrom)
```solidity
transferFrom(0xOwner, 0xRecipient, 2000000000000000000) // 2 MTK
```

### ✔️ Check Allowance
```solidity
allowance(0xOwner, 0xSpender)
```

---

## Screenshots Included
- `compilation.png` – Successful compile (no warnings)
- `deployment.png` – Contract deployed on Remix VM
- `token-info.png` – Name, symbol, decimals, totalSupply
- `transfer-test.png` – Transfer working with logs
- `events.png` – Approval and Transfer event logs

---

## Testing Performed
- Verified metadata retrieval  
- Verified initial minting to deployer  
- Successfully transferred tokens  
- Successfully approved allowance  
- Successfully delegated transfer using transferFrom  
- Verified events  
- Verified allowance reduction  
- Tested edge cases:  
  - transfer to zero address → reverted  
  - transfer exceeding balance → reverted  
  - transferFrom without approval → reverted  

---

## What I Learned
- How ERC-20 tokens work internally  
- How Solidity mappings store balances & allowances  
- Role of `msg.sender` in authorization  
- How events help track token movements  
- How wallets and exchanges use allowance model  
- How to debug smart contracts using Remix  
- Understanding decimals (18 like ETH)  
- Importance of zero-address and balance checks  

---

## Repository Structure
```
contracts/
   MyToken.sol
README.md
screenshots/
```

---

## License
MIT License
