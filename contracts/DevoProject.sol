// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Counters.sol";

contract DevoProject {
    event AddProject(address indexed _owner, uint256 indexed _id);

    using Counters for Counters.Counter;

    struct Project {
        string name;
        string logoURI;
        string description;
        address[] approvers;
        address owner;
    }

    Counters.Counter private projectIndex;

    mapping(uint256 => Project) private projects;

    function getLatestIndex() external view returns (uint256) {
        return projectIndex.current();
    }

    function getProjectName(uint256 projectId) external view returns (string memory) {
        return projects[projectId].name;
    }

    function getProjectLogoURI(uint256 projectId) external view returns (string memory) {
        return projects[projectId].logoURI;
    }

    function getProjectDescription(uint256 projectId) external view returns (string memory) {
        return projects[projectId].description;
    }

    function getProjectApprovers(uint256 projectId) external view returns (address[] memory) {
        return projects[projectId].approvers;
    }

    function getProjectOwner(uint256 projectId) external view returns (address) {
        return projects[projectId].owner;
    }

    function addApprover(uint256 projectId, address approver) external {
        projects[projectId].approvers.push(approver);
    }

    function createProject(
        string memory name,
        string memory logoURI,
        string memory description
    ) external {
        projectIndex.increment();
        projects[projectIndex.current()].name = name;
        projects[projectIndex.current()].logoURI = logoURI;
        projects[projectIndex.current()].description = description;
        projects[projectIndex.current()].owner = msg.sender;
        emit AddProject(msg.sender, projectIndex.current());
    }
}
