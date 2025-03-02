# KYC Complaint Token:

## Create leo Project:
- Command:
    ```sh
    leo new sandabgc_kyc_complaint_token
    ```

## Install dependencies:
- Command:
    ```sh
    cd sandabgc_kyc_complaint_token
    leo add token_registry
    leo add credits
    ```

## Compiled Program:
- Command:
    ```sh
    leo build
    ```

## Deploy to testnet:
- Value of Endpoint must be changed with: `https://api.explorer.provable.com/v1` in `.env` file.
- Now, the value of `PRIVATE_KEY` in `.env` must be replaced.
- We will require some token to deploy our program into testnet.

- Command:
    ```sh
    leo deploy --network testnet
    ```
    
    <details><summary> Detailed Output </summary><blockquote>

    ~~~sh
    Leo ✅ Compiled 'sandabgc_kyc_complaint_token.aleo' into Aleo instructions
    📦 Creating deployment transaction for 'sandabgc_kyc_complaint_token.aleo'...
    Base deployment cost for 'sandabgc_kyc_complaint_token.aleo' is 10.203575 credits.

    +-----------------------------------+----------------+
    | sandabgc_kyc_complaint_token.aleo | Cost (credits) |
    +-----------------------------------+----------------+
    | Transaction Storage               | 4.423000       |
    +-----------------------------------+----------------+
    | Program Synthesis                 | 4.780575       |
    +-----------------------------------+----------------+
    | Namespace                         | 1.000000       |
    +-----------------------------------+----------------+
    | Priority Fee                      | 0.000000       |
    +-----------------------------------+----------------+
    | Total                             | 10.203575      |
    +-----------------------------------+----------------+

    Your current public balance is 12.125933 credits.

    ? Do you want to submit deployment of program `sandabgc_kyc_complaint_token.aleo.aleo` to network testnet via endpoint https://api.explorer.provabl
    ✔ Do you want to submit deployment of program `sandabgc_kyc_complaint_token.aleo.aleo` to network testnet via endpoint https://api.explorer.provable.com/v1 using address aleo1jtytwx08t49pzupghcwrdf99q44q0a002fx5na6mpsx08y7xpqrsfrf6sx? · yes
    ✅ Created deployment transaction for 'sandabgc_kyc_complaint_token.aleo'

    Broadcasting transaction to https://api.explorer.provable.com/v1/testnet/transaction/broadcast...

    ⌛ Deployment at1mrgl3z89mptx3jgzp6xjvsvuj9d9d9c89mrwu5rrdh6jk8fq55zszv4ykq ('sandabgc_kyc_complaint_token.aleo') has been broadcast to https://api.explorer.provable.com/v1/testnet/transaction/broadcast.
    ~~~

    </blockquote></details>

- On-Chain Outputs: 
    - Transaction ID: `at1mrgl3z89mptx3jgzp6xjvsvuj9d9d9c89mrwu5rrdh6jk8fq55zszv4ykq`
    - Aleo Program: [https://testnet.aleo.info/program/sandabgc_kyc_complaint_token.aleo](https://testnet.aleo.info/program/sandabgc_kyc_complaint_token.aleo)
    - Deploy Txn: [https://testnet.aleo.info/transaction/at1mrgl3z89mptx3jgzp6xjvsvuj9d9d9c89mrwu5rrdh6jk8fq55zszv4ykq](https://testnet.aleo.info/transaction/at1mrgl3z89mptx3jgzp6xjvsvuj9d9d9c89mrwu5rrdh6jk8fq55zszv4ykq) 


## Sign with `Transaction ID`:
- For me, program deployed Transaction ID is: `at1mrgl3z89mptx3jgzp6xjvsvuj9d9d9c89mrwu5rrdh6jk8fq55zszv4ykq`. Command:
    ```sh
    leo account sign -d --private-key <redacted> --message "at1mrgl3z89mptx3jgzp6xjvsvuj9d9d9c89mrwu5rrdh6jk8fq55zszv4ykq" --raw
    ```
- Output:
    ```sh
    sign1zwsr2cqgm9p4ythqhuhv2lyrc38cvl30y2uyw0y4ntqur2w76vq04v6dypdmfun528f56n77lx278uwrygtv40qedl5tux8kxy4ujq4zagrt29qtpw7qxv39ajtn8yxgyk093n6ah79jvpv2l3kfnalnz9kryey36lgje05a8hr7qzv6zl3mgpr6qrkvuvd62hpf0233gahpy4unrs4
    ```