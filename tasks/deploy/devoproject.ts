import { task } from "hardhat/config";
import { TaskArguments } from "hardhat/types";

import { DevoProject, DevoProject__factory } from "../../typechain";

task("deploy:DevoProject").setAction(async function (taskArguments: TaskArguments, { ethers }) {
  const devoProjectFactory: DevoProject__factory = await ethers.getContractFactory("DevoProject");
  const devoProject: DevoProject = <DevoProject>await devoProjectFactory.deploy();
  await devoProject.deployed();

  console.log("DevoProject deployed to: ", devoProject.address);
});
