// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract YoPortal {
    uint256 totalYos;

    uint256 private seed;

    /**
     * map for mapping address and time last Yo-ed
     */
    mapping(address => uint256) public lastYoedAt;

    constructor() payable {
        console.log("Yo, I'm Ace and I am a smart fucking contract!");

        seed = (block.timestamp + block.difficulty) % 100;
    }

    event NewYo(address indexed from, uint256 timestamp, string message);

    /**
    * Update Total Yo Count event
     */
    event UpdatYoCount(uint256 newTotalYoCount);

    struct Yo {
        address yoInitiator;
        string message;
        uint256 timestamp;
    }

    Yo[] yos;

    function sayYo(string memory _message) public {
        require(
            lastYoedAt[msg.sender] + 2 minutes < block.timestamp,
            "Wait 2minutes before you can say another Yo"
        );

        lastYoedAt[msg.sender] = block.timestamp; //update user timestamp

        totalYos++;
        console.log("%s just yo-ed you", msg.sender);

        yos.push(Yo(msg.sender, _message, block.timestamp));

        /**
         * Generate new seed for next user that sends a Yo
         */
        seed = (block.difficulty + block.timestamp + seed) % 100;

        if (seed <= 50) {
            console.log("%s won!", msg.sender);

            uint256 prizeAmount = 0.0001 ether;
            require(
                prizeAmount <= address(this).balance,
                "Hey smartass,why you tryna withdraw more than this contract's balance? gtfoh!."
            );
            (bool success, ) = (msg.sender).call{value: prizeAmount}("");
            require(
                success,
                "Oops, couldn't withdraw money cos you broke, mf!"
            );
        }

        emit NewYo(msg.sender, block.timestamp, _message);
        emit UpdatYoCount(totalYos);
    }

    function getTotalYoObjects() public view returns (Yo[] memory) {
        return yos;
    }

    function getTotalYos() public view returns (uint256) {
        console.log("Currently we have a total of %d Yo's!", totalYos);
        return totalYos;
    }
}
