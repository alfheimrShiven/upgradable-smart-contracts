# Upgradeable Smart Contract: UUPS Proxy 🥷🏽

## About
In this project, I demonstrate upgrading of a contract using the Universal Upgradable Proxy Standard (UUPS).

## Reference Resources
[Openzeppelin- Proxies](https://docs.openzeppelin.com/contracts/4.x/api/proxy)

[ERC-1822: Universal Upgradeable Proxy Standard (UUPS)](https://eips.ethereum.org/EIPS/eip-1822)

## Getting Started

### Requirements

- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - You'll know you did it right if you can run `git --version` and you see a response like `git version x.x.x`
- [foundry](https://getfoundry.sh/)
  - You'll know you did it right if you can run `forge --version` and you see a response like `forge 0.2.0 (816e00b 2023-03-16T00:05:26.396218Z)`

### Quickstart

```
git clone https://github.com/alfheimrShiven/upgradeable-smart-contracts.git
cd upgradeable-smart-contracts
make start
```

## Testing

We talk about 4 test tiers in the video. 

1. Unit
2. Integration
3. Forked
4. Staging

In this repo we cover #1 & #2 tests. 

```
forge test
```

### Test Coverage

```
forge coverage
```

and for coverage based testing: 

```
forge coverage --report debug
```

## Deployment to a testnet or mainnet

#### 1. Setup environment variables

You'll want to set your `SEPOLIA_RPC_URL` and `SEPOLIA_PRIVATE_KEY` as environment variables. You can add them to a `.env` file.

- `SEPOLIA_PRIVATE_KEY`: The private key of your account (like from [metamask](https://metamask.io/)). **NOTE:** FOR DEVELOPMENT, PLEASE USE A KEY THAT DOESN'T HAVE ANY REAL FUNDS ASSOCIATED WITH IT.
  - You can [learn how to export it here](https://metamask.zendesk.com/hc/en-us/articles/360015289632-How-to-Export-an-Account-Private-Key).
- `SEPOLIA_RPC_URL`: This is url of the sepolia testnet node you're working with. You can get setup with one for free from [Alchemy](https://alchemy.com/?a=673c802981)

Optionally, add your `ETHERSCAN_API_KEY` if you want to verify your contract on [Etherscan](https://etherscan.io/).

#### 2. Get testnet ETH

Head over to [faucets.chain.link](https://faucets.chain.link/) and get some testnet ETH. You should see the ETH show up in your metamask.

#### 3. Deploy Box

```
make deployBox ARGS="--network sepolia"
```

#### 4. Upgrade Box

```
make upgradeBox ARGS="--network sepolia"
```

## Estimate gas

You can estimate how much gas things cost by running:

```
forge snapshot
```

And you'll see an output file called `.gas-snapshot`

## Formatting

To run code formatting:
```
forge fmt
```


## Thank you! 🤗

If you appreciated this, feel free to follow me:

[**Github**](https://github.com/alfheimrShiven)

[![Shivens LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/shivends/)

[![Shivens Twitter](https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/shiven_alfheimr)


