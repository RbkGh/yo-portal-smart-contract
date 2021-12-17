# Yo Playfield Smart Contract

# Replace your url and account private key in hardhart.config.js 
```json
rinkeby: {
      url: 'https://eth-rinkeby.alchemyapi.io/v2/whatever_yours_is_from_alchemy.io',
      accounts: ['your_wallet_private_key'],
    }
```

# Deploy on Rinkeby or Localhost or Mainnet
```shell
npx hardhat run scripts/deploy.js --network rinkeby
```

```text
Once deployed, your smart contract address will be displayed in console, then you can
pick up your abi file in  /artifacts/contracts/YoPortal.sol/YoPortal.json#abi 

ie 
"abi": [
    {
      "inputs": [],
      "stateMutability": "payable",
      "type": "constructor"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": true,
          "internalType": "address",
          "name": "from",
          "type": "address"
        },
        {
          "indexed": false,
          "internalType": "uint256",
          "name": "timestamp",
          "type": "uint256"
        },
        {
          "indexed": false,
          "internalType": "string",
          "name": "message",
          "type": "string"
        }
      ],
      "name": "NewYo",
      "type": "event"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": false,
          "internalType": "uint256",
          "name": "newTotalYoCount",
          "type": "uint256"
        }
      ],
      "name": "UpdatYoCount",
      "type": "event"
    },
    {
      "inputs": [],
      "name": "getTotalYoObjects",
      "outputs": [
        {
          "components": [
            {
              "internalType": "address",
              "name": "yoInitiator",
              "type": "address"
            },
            {
              "internalType": "string",
              "name": "message",
              "type": "string"
            },
            {
              "internalType": "uint256",
              "name": "timestamp",
              "type": "uint256"
            }
          ],
          "internalType": "struct YoPortal.Yo[]",
          "name": "",
          "type": "tuple[]"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "getTotalYos",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "",
          "type": "address"
        }
      ],
      "name": "lastYoedAt",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "string",
          "name": "_message",
          "type": "string"
        }
      ],
      "name": "sayYo",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    }
  ]

```






