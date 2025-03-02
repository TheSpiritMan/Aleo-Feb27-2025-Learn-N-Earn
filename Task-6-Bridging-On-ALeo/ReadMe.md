# Bridging On Aleo

- Install Leo Wallet and Metamask Wallet Extension in Chrome Browser.
- Make sure, you have some Token in ETH, USDT or USDC in ETH Sepolia Testnet.
- Visit [https://staging.verulink.com](https://staging.verulink.com/).

    <img src="assets/image1.png">

- Connect Metamask as well as Leo Wallet if possible like below:
    
    <img src="assets/image2.png">
    
    <img src="assets/image3.png">

    <img src="assets/image4.png">

    <img src="assets/image5.png">


- Once connected, we can start bridging like below:
    
    <img src="assets/image6.png">

- From above, we can say that we have 1000 USDC and we am sending 50 USDC in Aleo Wallet.
    <img src="assets/image7.png">
    <img src="assets/image8.png">
    <img src="assets/image9.png">
   
    <img src="assets/image10.png">

- From above image, we can say that `50 vUSDC` is ready to Mint in Aleo Network. Click on that transaction, something like below will open up:
    <img src="assets/image11.png">
    <img src="assets/image12.png">
    <img src="assets/image13.png">

- Once completed, we can see:

    <img src="assets/image14.png">

- For me, Transaction ID: `at13e7zu6emmmmfxjk6xkun4dx0mjp8flc90s9pqpudjr2syveffgzqj2rtjd`.
    <img src="assets/image15.png">

- Here, I transferred 50USDC from ETH Sepolia Network to ALEO Testnet.

# Sign with `Transaction ID`:
- For me, program deployed Transaction ID is: `at13e7zu6emmmmfxjk6xkun4dx0mjp8flc90s9pqpudjr2syveffgzqj2rtjd`. Command:
    ```sh
    leo account sign -d --private-key <redacted> --message "at13e7zu6emmmmfxjk6xkun4dx0mjp8flc90s9pqpudjr2syveffgzqj2rtjd" --raw
    ```
- Output:
    ```sh
    sign1fpvmzc6rqt98gnp38ssly45332whe02gxqdr885hkql3eqz8xgqdhmujp4tzzp3xxrrpxfs28845apqjj3mmfphh73r7zy8ealzr2q9zagrt29qtpw7qxv39ajtn8yxgyk093n6ah79jvpv2l3kfnalnz9kryey36lgje05a8hr7qzv6zl3mgpr6qrkvuvd62hpf0233gahpy06085t
    ```