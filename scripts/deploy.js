const { hexStripZeros } = require("@ethersproject/bytes");

const main = async () => {
    const yoContractFactory = await hre.ethers.getContractFactory('YoPortal');
    const yoContract = await yoContractFactory.deploy({
      value: hre.ethers.utils.parseEther('0.001'),
    });
  
    await yoContract.deployed();
  
    console.log('YoPortal address: ', yoContract.address);
};

const runMain = async () => {
  try {
      await main();
      process.exit(0);
  } catch (error) {
      console.log('Error occured in deployment : ',error);
      process.exit(1);
  }
};

runMain();