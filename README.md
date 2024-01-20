# Game Token

This is simple  implementation of an erc-20  which allows for minting and burning of tokens, and has a way to keep track of game items which can be distibuted and redeemed by users.


## Usage
Contract Address:: https://testnet.snowtrace.io/address/0x5B58Cb5D9361b05231FBC47Cd7C35E5C6Ff150C4

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Token.s.sol:TokenScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```