// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract DevoPullRequest {
    struct PullRequest {
        uint256 id;
        string title;
        string description;
        string url;
        string state;
        address responsible;
        uint256 projectId;
    }

    // function createPullRequest(
    //     string memory id,
    //     string memory logoURI,
    //     string memory description
    // ) external {
    // projectIndex.increment();
    // projects[projectIndex.current()].name = name;
    // projects[projectIndex.current()].logoURI = logoURI;
    // projects[projectIndex.current()].description = description;
    // projects[projectIndex.current()].owner = msg.sender;
    // emit AddProject(msg.sender, projectIndex.current());
    // emit AddProject(msg.sender, projectIndex.current());
    // }
}
