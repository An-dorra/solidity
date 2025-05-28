// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    address owner;
    address constant FEEDETHTOUSDTADDRESS = 0x694AA1769357215DE4FAC081bf1f309aDC325306;
    AggregatorV3Interface internal dataFeed;

    constructor() {
        owner = msg.sender;
        dataFeed = AggregatorV3Interface(
           FEEDETHTOUSDTADDRESS
        );
    }


    /**
     * Returns the latest answer.
     */
    function getChainlinkDataFeedLatestAnswer() public view returns (int) {
        // prettier-ignore
        (
            /* uint80 roundId */,
            int256 answer,
            /*uint256 startedAt*/,
            /*uint256 updatedAt*/,
            /*uint80 answeredInRound*/
        ) = dataFeed.latestRoundData();
        return answer;
    }
}
