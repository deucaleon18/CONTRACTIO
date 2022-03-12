// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.7.0;

// import "github.com/Arachnid/solidity-stringutils/strings.sol";
contract Banking {
    //  using strings for *;

    uint256 public serialNumber = 0;
    uint256 public transacNum = 0;
    uint256 public bankBalance = 0;

    //Defining a struct to store the account details
    struct Account {
        uint256 serial;
        uint256 createdAt;
        string name;
        string location;
        address creator;
        //   bytes32 accountName;
        uint256 balance;
        bool doesExist;
    }

    constructor() public {
        accounts[0] = Account(
            0,
            block.timestamp,
            "SoliBank",
            "NIT Durgapur",
            address(this),
            0,
            true
        );
    }

    //Defining a struct to store transaction record
    struct Transaction {
        uint256 transacNum;
        uint256 currentBalance;
        uint256 amountTransacted;
        uint256 createdAt;
        string transacType;
        uint256 accountSerialNumber;
    }
    



    // All the mappings present in the contract
    mapping(uint256 => Account) public accounts;
    mapping(uint256 => Transaction) public transactions;

    // error InsufficientFunds(uint _currentAccountSerialNumber,uint _balanceRequested,uint _balanceAvailable,string _transactionType);

    event AccountCreated(
        uint256 _serialNumber,
        bytes32 _name,
        bytes32 _location,
        uint256 _createdAt,
        uint256 _balance
    );

    event TransactionCompleted(
        uint256 _amount,
        uint256 _transacNumber,
        uint256 _currentAccountSerial,
        bytes32 _transactionType
    );



    //Function to create account , the 2 ETH balance will be taken from your ethereum account and deposited to the banking contract
    function createAccount(
        address payable _creator,
        string memory _name,
        string memory _location
    ) public payable {
        if (_creator.balance >= 3) {
            serialNumber++;
            accounts[serialNumber] = Account(
                serialNumber,
                block.timestamp,
                _name,
                _location,
                _creator,
                2,
                true
            );
            bankBalance += 2;
            transacNum++;
            transactions[transacNum] = Transaction(
                transacNum,
                2,
                2,
                block.timestamp,
                "NewAccount",
                serialNumber
            );
            emit TransactionCompleted(
                2,
                transacNum,
                serialNumber,
                "NewAccount"
            );
        } else {
            revert("Insufficient Funds");
            // revert InsufficientFunds(serialNumber,2,_creator.balance-1,'NewAccount');
        }
    }





