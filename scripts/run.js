
const hre = require("hardhat");

const main = async () => {
    const yoContractFactory = await hre.ethers.getContractFactory('YoPortal');
    const yoContract = await yoContractFactory.deploy({
      value: hre.ethers.utils.parseEther('0.1'),
    });
    await yoContract.deployed();
    console.log('Contract Location On Block:', yoContract.address);
  
    /*
     * Get Contract balance
     */
    let contractBalance = await hre.ethers.provider.getBalance(
      yoContract.address
    );
    console.log(
      'Contract balance:',
      hre.ethers.utils.formatEther(contractBalance)
    );
  
    /*
     * Send Yo
     */
    let waveTxn = await yoContract.sayYo('Thought of you!');
    await waveTxn.wait();

    let waveTxn2 = await yoContract.sayYo('Thought of you 2!');
    await waveTxn2.wait();
  
    /*
     * Get Contract balance to see what happened!
     */
    contractBalance = await hre.ethers.provider.getBalance(yoContract.address);
    console.log(
      'Contract balance:',
      hre.ethers.utils.formatEther(contractBalance)
    );
  
    let allYos = await yoContract.getTotalYos();
    console.log(allYos);
  };

const runMain = async () => {
    try {
        await main();
        process.exit(0);
    } catch (error) {
        console.log("Error occured : ", error);
        process.exit(1);
    }
};

runMain();

