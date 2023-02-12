// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract Consumer {
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function deposit() public payable {}
}

contract ngoWallet {
    address payable public owner;

    mapping(address => uint256) public allowanceAMT;
    mapping(address => bool) public isLeader;
    mapping(address => bool) public chiefs;

    struct voteOption {
        string title;
        uint256 numVotes;
    }

    struct voter {
        uint256 whom;
        bool voted;
    }

    address public electionAdmin;

    // Voters who participated in the current election
    mapping(address => voter) public voters;
    address[] participatedVoters;

    voteOption[] public voteOptions;

    string public electionName;

    uint256 public totalVotes;

    address payable newOwner;
    mapping(address => mapping(address => bool)) newOwnerChiefVotedBool;
    uint256 chiefsResetCount;
    uint256 public constant totalChiefsLockIn = 3;

    constructor() payable {
        owner = payable(msg.sender);
    }

    //donation from any person/organization

    function makeDonation() public payable {}

    //NGO's Total available funds
    function totalFunds() public view returns (uint256) {
        return address(this).balance;
    }

    //For assigning allowance for leaders

    function setAllowance(address leader, uint256 amount) public {
        require(
            msg.sender == owner,
            "You are not the Owner, so you can assign budgets!"
        );
        allowanceAMT[leader] = amount;
        if (amount > 0) {
            isLeader[leader] = true;
        } else {
            isLeader[leader] = false;
        }
    }

    // Ownership Transfer

    function transferOwner(address payable _newOwner) public {
        require(
            chiefs[msg.sender],
            "You are not a Chief! Can't transfer ownership"
        );
        require(
            newOwnerChiefVotedBool[_newOwner][msg.sender] == false,
            "You have already voted!"
        );
        if (_newOwner != newOwner) {
            newOwner = _newOwner;
            chiefsResetCount = 0;
        }

        chiefsResetCount++;

        if (chiefsResetCount >= totalChiefsLockIn) {
            owner = newOwner;
            newOwner = payable(address(0));
        }
    }

    // Adding a new Chief

    function addChief(address chief, bool isChief) public {
        require(
            msg.sender == owner,
            "You are not the Owner, add the chiefs for this wallet!"
        );
        chiefs[chief] = isChief;
    }

    //Funds Transfer Function

    function transferFunds(
        address payable to,
        uint256 amount,
        bytes memory payload
    ) public returns (bytes memory) {
        // If not the super admin/owner
        if (msg.sender != owner) {
            require(
                allowanceAMT[msg.sender] >= amount,
                "You are trying to send more than your alloted funds!"
            );
            require(
                isLeader[msg.sender],
                "You dont have the access to transfer funds!"
            );
            allowanceAMT[msg.sender] -= amount;
        } else {
            require(
                msg.sender == owner,
                "You are not the NGO Admin, Aborting Transfer"
            );
        }
        (bool success, bytes memory returnData) = to.call{value: amount}(
            payload
        );
        require(success, "Aborting Transfer!, Transfer was not successful");
        return returnData;
    }

    function startElection(string memory _electionName) public {
        require(
            chiefs[msg.sender],
            "You are not a Chief! Can't Start the election"
        );
        electionAdmin = msg.sender;
        electionName = _electionName;
    }

    function addVotingOption(string memory _title) public {
        require(
            msg.sender == electionAdmin,
            "You are not the Election Admin! Can't add voting options to election"
        );
        voteOptions.push(voteOption(_title, 0));
    }

    function electionStatus() public view returns (voteOption[] memory) {
        return voteOptions;
    }

    function endElection() public {
        require(
            msg.sender == electionAdmin,
            "You are not the Election Admin! Can't add voting options to election"
        );

        delete electionAdmin;

        for (uint256 i = 0; i < participatedVoters.length; i++) {
            voters[participatedVoters[i]].voted = false;
            delete voters[participatedVoters[i]].whom;
        }

        delete voteOptions;

        delete electionName;

        delete totalVotes;

        delete participatedVoters;
    }

    function vote(uint256 voteOptionIndex) public {
        require(!voters[msg.sender].voted, "Already Voted");
        voters[msg.sender].whom = voteOptionIndex;
        voters[msg.sender].voted = true;
        participatedVoters.push(msg.sender);
        voteOptions[voteOptionIndex].numVotes++;
        totalVotes++;
    }
}
