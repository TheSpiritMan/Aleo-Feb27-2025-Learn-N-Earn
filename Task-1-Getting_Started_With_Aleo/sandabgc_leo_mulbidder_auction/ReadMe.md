# BUILDH3R Feb27 ALeo

## Create new project:
- Command:
    ```sh
    leo new sandabgc_leo_mulbidder_auction
    ```

- Since, we are trying to create an auction app, there must be bidder and owner. So let's create 2 bidder account and 1 owner.
- Command:
    ```sh
    snarkos account new
    ```
- So, run above command 3 times in terminal:
    <details><summary> Detailed Output </summary><blockquote>

    ~~~
    $ snarkos account new

    Private Key  <redacted>
        View Key  <redacted>
        Address  aleo1jtytwx08t49pzupghcwrdf99q44q0a002fx5na6mpsx08y7xpqrsfrf6sx

    $ snarkos account new

    Private Key  <redacted>
        View Key  <redacted>
        Address  aleo1pamgdq88tvutdl27yrvyzangzya3e8qjdjwcrayrdmaeh8yd5cxqfj3kfh

    $ snarkos account new

    Private Key  <redacted>
        View Key  <redacted>
        Address  aleo1aazfptm8a22s4x2tlzn4ydd2pjdrwnkk7tnrkl5kcpa9qqehnuqst7qhfv
    ~~~
    
    </blockquote></details>

- In above output, suppose 1 a/c with Address `aleo1jtytwx08t49pzupghcwrdf99q44q0a002fx5na6mpsx08y7xpqrsfrf6sx` is owner and remaining 2nd and 3rd a/cs are bidders. 

- Modify `sandabgc_leo_mulbidder_auction/src/main.leo`. Do not forget to replace owner address in `main.leo` file.

- `.env` is created during the creation of the project. By default, it contains:
    ```sh
    NETWORK=testnet
    PRIVATE_KEY=APrivateKey1zkp8CZNn3yeCseEtxuVPbDCwSyhGW6yZKUYKfgXmcpoGPWH
    ENDPOINT=https://api.explorer.aleo.org/v1
    ```

- Value of Endpoint must be changed with: `https://api.explorer.provable.com/v1`
- New `.env`:
    ```sh
    NETWORK=testnet
    PRIVATE_KEY=APrivateKey1zkp8CZNn3yeCseEtxuVPbDCwSyhGW6yZKUYKfgXmcpoGPWH
    ENDPOINT=https://api.explorer.provable.com/v1
    ```

     
## Deploy To Testnet:
- Make sure you load up ALEO Token in each a/cs.
- Now, the value of `PRIVATE_KEY` in `.env` must be replaced with the `PRIVATE_KEY` of the Owner.
- Command:
    ```sh
    leo deploy --network testnet
    ```


    <details><summary> Detailed Output </summary><blockquote>

    ~~~
    $ leo deploy --network testnet
       Leo ✅ Compiled 'sandabgc_leo_mulbidder_auction.aleo' into Aleo instructions
        📦 Creating deployment transaction for 'sandabgc_leo_mulbidder_auction.aleo'...


        Base deployment cost for 'sandabgc_leo_mulbidder_auction.aleo' is 14.51145 credits.

        +-------------------------------------+----------------+
        | sandabgc_leo_mulbidder_auction.aleo | Cost (credits) |
        +-------------------------------------+----------------+
        | Transaction Storage                 | 3.642000       |
        +-------------------------------------+----------------+
        | Program Synthesis                   | 9.869450       |
        +-------------------------------------+----------------+
        | Namespace                           | 1.000000       |
        +-------------------------------------+----------------+
        | Priority Fee                        | 0.000000       |
        +-------------------------------------+----------------+
        | Total                               | 14.511450      |
        +-------------------------------------+----------------+

        Your current public balance is 36.97779 credits.

        ? Do you want to submit deployment of program `sandabgc_leo_mulbidder_auction.aleo.aleo` to network testnet via endpoint https://api.explorer.provable.com/v1 using address aleo1jtytwx08t49pzupghcwrdf99q44q0a002fx5na6mpsx08y7xpqrs
        ✔ Do you want to submit deployment of program `sandabgc_leo_mulbidder_auction.aleo.aleo` to network testnet via endpoint https://api.explorer.provable.com/v1 using address aleo1jtytwx08t49pzupghcwrdf99q44q0a002fx5na6mpsx08y7xpqrsfrf6sx? · yes
        ✅ Created deployment transaction for 'sandabgc_leo_mulbidder_auction.aleo'

        Broadcasting transaction to https://api.explorer.provable.com/v1/testnet/transaction/broadcast...

        ⌛ Deployment at1jc4p0tjy36murvlcsq6l0u2y4sjgkdtjk55m9nrrgm2sdkw4jcfq44nvwg ('sandabgc_leo_mulbidder_auction.aleo') has been broadcast to https://api.explorer.provable.com/v1/testnet/transaction/broadcast.
    ~~~

    </blockquote></details>


- On-Chain Outputs: 
    - Transaction ID: `at1jc4p0tjy36murvlcsq6l0u2y4sjgkdtjk55m9nrrgm2sdkw4jcfq44nvwg`
    - Aleo Program: [https://testnet.aleo.info/program/sandabgc_leo_mulbidder_auction.aleo](https://testnet.aleo.info/program/sandabgc_leo_mulbidder_auction.aleo)
    - Deploy Txn: [https://testnet.aleo.info/transaction/at1jc4p0tjy36murvlcsq6l0u2y4sjgkdtjk55m9nrrgm2sdkw4jcfq44nvwg](https://testnet.aleo.info/transaction/at1jc4p0tjy36murvlcsq6l0u2y4sjgkdtjk55m9nrrgm2sdkw4jcfq44nvwg) 


## Execute Transaction:
### 1st Bid:
- Now, the value of `PRIVATE_KEY` in `.env` must be replaced with the `PRIVATE_KEY` of the 1st bidder.
- Run `place_bid` transaction:
    - Code Snippet:
        ```sh
        leo execute place_bid <Address> <Amount> --program <Program_name> --broadcast
        ```
    
    - Command:
        ```sh
        leo execute place_bid aleo1pamgdq88tvutdl27yrvyzangzya3e8qjdjwcrayrdmaeh8yd5cxqfj3kfh 160u64 --program sandabgc_leo_mulbidder_auction --broadcast
        ```
        <details><summary> Detailed Output </summary><blockquote>

        ~~~
        Base execution cost for 'sandabgc_leo_mulbidder_auction' is 0.001638 credits.

        +--------------------------------+----------------+
        | sandabgc_leo_mulbidder_auction | Cost (credits) |
        +--------------------------------+----------------+
        | Transaction Storage            | 0.001638       |
        +--------------------------------+----------------+
        | On-chain Execution             | 0.000000       |
        +--------------------------------+----------------+
        | Priority Fee                   | 0.000000       |
        +--------------------------------+----------------+
        | Total                          | 0.001638       |
        +--------------------------------+----------------+

        Your current public balance is 15.027526 credits.

        ? Do you want to submit execution of function `place_bid` on program `sandabgc_leo_mulbidder_auction.aleo` to network testnet via endpoint https://api.explorer.provable.com/v1 using address aleo1pamgdq88tvutdl27yrvyzangzya3e8qjdj
        ✔ Do you want to submit execution of function `place_bid` on program `sandabgc_leo_mulbidder_auction.aleo` to network testnet via endpoint https://api.explorer.provable.com/v1 using address aleo1pamgdq88tvutdl27yrvyzangzya3e8qjdjwcrayrdmaeh8yd5cxqfj3kfh? · yes
        ✅ Created execution transaction for 'sandabgc_leo_mulbidder_auction.aleo'

        Broadcasting transaction to https://api.explorer.provable.com/v1/testnet/transaction/broadcast...

        ⌛ Execution at16zuaxwh3dlpnftdjwkt6j07tw3zwuw5mkp5yzh52flzpvgz6dcyqagj36c ('sandabgc_leo_mulbidder_auction') has been broadcast to https://api.explorer.provable.com/v1/testnet/transaction/broadcast.
        ~~~

        </blockquote></details>
- On-Chain Outputs:
    - Transaction ID: `at16zuaxwh3dlpnftdjwkt6j07tw3zwuw5mkp5yzh52flzpvgz6dcyqagj36c`
    - Encrypted Record: 
        ```sh
        record1qyqspnxge9zdullgdctvg3ee2umc6h7wgnztk2ra9qlgquaqdeqevwc9qvrxy6tyv3jhyscqqgpqqnsjmng7dg80g6du4av3zzgcuxfdc7mffycqn8xresxqy2vfw5s8gppsd7g853yrf9w6wksyfj94nxhv6srd34etv6pjhr8qzk0d8yysvctdda6kuaprqqpqzqq8p4zntzl3skrygpv7ptju7x46sr6kxl3sfsl4fvys42a2qwwmpgykju6lwa5kumn9wg3sqqspqrekzzqlvqnrd3wvdnfae7j4kxq5055eu9zqt4upshle2a8k6xks5xnxre6sdg2ctr9weh5lv827cd0c2zusr0z6m7gpff4yaxh8nnsfekky29
        ```
       
### 2nd Bid:
- Now, the value of `PRIVATE_KEY` in `.env` must be replaced with the `PRIVATE_KEY` of the 2nd bidder.
- Run `place_bid` transaction:
    - Code Snippet:
        ```sh
        leo execute place_bid <Address> <Amount> --program <Program_name> --broadcast
        ```
    
    - Command:
        ```sh
        leo execute place_bid aleo1aazfptm8a22s4x2tlzn4ydd2pjdrwnkk7tnrkl5kcpa9qqehnuqst7qhfv 80u64 --program sandabgc_leo_mulbidder_auction --broadcast
        ```
        <details><summary> Detailed Output </summary><blockquote>

        ~~~
        Base execution cost for 'sandabgc_leo_mulbidder_auction' is 0.001638 credits.

        +--------------------------------+----------------+
        | sandabgc_leo_mulbidder_auction | Cost (credits) |
        +--------------------------------+----------------+
        | Transaction Storage            | 0.001638       |
        +--------------------------------+----------------+
        | On-chain Execution             | 0.000000       |
        +--------------------------------+----------------+
        | Priority Fee                   | 0.000000       |
        +--------------------------------+----------------+
        | Total                          | 0.001638       |
        +--------------------------------+----------------+

        Your current public balance is 11.230986 credits.

        ? Do you want to submit execution of function `place_bid` on program `sandabgc_leo_mulbidder_auction.aleo` to network testnet via endpoint https://api.explorer.provable.com/v1 using address aleo1aazfptm8a22s4x2tlzn4ydd2pjdrwnkk7t
        ✔ Do you want to submit execution of function `place_bid` on program `sandabgc_leo_mulbidder_auction.aleo` to network testnet via endpoint https://api.explorer.provable.com/v1 using address aleo1aazfptm8a22s4x2tlzn4ydd2pjdrwnkk7tnrkl5kcpa9qqehnuqst7qhfv? · yes
        ✅ Created execution transaction for 'sandabgc_leo_mulbidder_auction.aleo'

        Broadcasting transaction to https://api.explorer.provable.com/v1/testnet/transaction/broadcast...

        ⌛ Execution at15deadc5zqq862tv64w4ds9zlnmzcxdcpwgz08mq3lyj5lcd96yzqtex8sq ('sandabgc_leo_mulbidder_auction') has been broadcast to https://api.explorer.provable.com/v1/testnet/transaction/broadcast.
        ~~~

        </blockquote></details>
- On-Chain Outputs:
    - Transaction ID: `at15deadc5zqq862tv64w4ds9zlnmzcxdcpwgz08mq3lyj5lcd96yzqtex8sq`
    - Encrypted Record: 
        ```sh
        record1qyqspqqhpxafwyvmjvdgj7zsl4e9g83p2hm6zmwfv96yddlzam7l2gcdqvrxy6tyv3jhyscqqgpqqskauw77vq0vfu4mhn64q8xfjp8vl7u69f4dzzkme3el86w335sq63rjwyq9pzl5rj4kalkgdua9mp8xjxtqlhfqvw6q2h6javz38ggqvctdda6kuaprqqpqzqq7qv765jlzrjgnkstq0pxxv2svral0jawk8mpw0xu4gpyqwfappyykju6lwa5kumn9wg3sqqspqz6mv4zwdqngpy5uau6rugs4zealw3xwmth54ts807s6uwxcl9qq7uurns4qyjyrlx647ngcjlnfj7w4f4yp0jnn7kac047qkxh3cdg2nph8t8
        ```
        
## Decrypt Record:
- Since, we will need outputs from previous bidder transaction. We will need to decrypt those` records.
- Code Snippet:
    ```sh
    snarkos developer decrypt -v <VIEW_KEY> -c <RECORD_CIPHERTEXT>
    ```
- Here:
    - `VIEW_KEY` can be owner.
    - `RECORD_CIPHERTEXT` must be encrypted record outputs from previous bidder. We can get these values in explorer itself.

- Decrypt for Bidder 1:
    ```sh
    snarkos developer decrypt -v <redacted> -c record1qyqspnxge9zdullgdctvg3ee2umc6h7wgnztk2ra9qlgquaqdeqevwc9qvrxy6tyv3jhyscqqgpqqnsjmng7dg80g6du4av3zzgcuxfdc7mffycqn8xresxqy2vfw5s8gppsd7g853yrf9w6wksyfj94nxhv6srd34etv6pjhr8qzk0d8yysvctdda6kuaprqqpqzqq8p4zntzl3skrygpv7ptju7x46sr6kxl3sfsl4fvys42a2qwwmpgykju6lwa5kumn9wg3sqqspqrekzzqlvqnrd3wvdnfae7j4kxq5055eu9zqt4upshle2a8k6xks5xnxre6sdg2ctr9weh5lv827cd0c2zusr0z6m7gpff4yaxh8nnsfekky29
    ```
    <details><summary> Detailed Output </summary><blockquote>

    ~~~
    {
    owner: aleo1jtytwx08t49pzupghcwrdf99q44q0a002fx5na6mpsx08y7xpqrsfrf6sx.private,
    bidder: aleo1pamgdq88tvutdl27yrvyzangzya3e8qjdjwcrayrdmaeh8yd5cxqfj3kfh.private,
    amount: 160u64.private,
    is_winner: false.private,
    _nonce: 4435625959537922936117319083372995425336764959536233896572679534908886902298group.public
    }
    ~~~

    </blockquote></details>

- Decrypt for Bidder 2:
    ```sh
    snarkos developer decrypt -v <redacted> -c record1qyqspqqhpxafwyvmjvdgj7zsl4e9g83p2hm6zmwfv96yddlzam7l2gcdqvrxy6tyv3jhyscqqgpqqskauw77vq0vfu4mhn64q8xfjp8vl7u69f4dzzkme3el86w335sq63rjwyq9pzl5rj4kalkgdua9mp8xjxtqlhfqvw6q2h6javz38ggqvctdda6kuaprqqpqzqq7qv765jlzrjgnkstq0pxxv2svral0jawk8mpw0xu4gpyqwfappyykju6lwa5kumn9wg3sqqspqz6mv4zwdqngpy5uau6rugs4zealw3xwmth54ts807s6uwxcl9qq7uurns4qyjyrlx647ngcjlnfj7w4f4yp0jnn7kac047qkxh3cdg2nph8t8
    ```
    <details><summary> Detailed Output </summary><blockquote>

    ~~~
    {
    owner: aleo1jtytwx08t49pzupghcwrdf99q44q0a002fx5na6mpsx08y7xpqrsfrf6sx.private,
    bidder: aleo1aazfptm8a22s4x2tlzn4ydd2pjdrwnkk7tnrkl5kcpa9qqehnuqst7qhfv.private,
    amount: 80u64.private,
    is_winner: false.private,
    _nonce: 4616969365873901328132194823203805499106223754935324867663590682527501419379group.public
    }
    ~~~

    </blockquote></details>

## Resolve Time:
- Since, both the bidder has succesfully bidded, it is the time for owner to resolve who wins the bid.
- Now, the value of `PRIVATE_KEY` in `.env` must be replaced with the `PRIVATE_KEY` of the owner.
- Run `resolve` transaction:
    - Code Snippet:
        ```sh
        leo execute resolve <Output_Of_1st_Bid> <Output_Of_2nd_Bid> --program <Program_name> --broadcast
        ```

    - Command:
        ```sh
        leo execute resolve '{
        owner: aleo1jtytwx08t49pzupghcwrdf99q44q0a002fx5na6mpsx08y7xpqrsfrf6sx.private,
        bidder: aleo1pamgdq88tvutdl27yrvyzangzya3e8qjdjwcrayrdmaeh8yd5cxqfj3kfh.private,
        amount: 160u64.private,
        is_winner: false.private,
        _nonce: 4435625959537922936117319083372995425336764959536233896572679534908886902298group.public
        }' '{
        owner: aleo1jtytwx08t49pzupghcwrdf99q44q0a002fx5na6mpsx08y7xpqrsfrf6sx.private,
        bidder: aleo1aazfptm8a22s4x2tlzn4ydd2pjdrwnkk7tnrkl5kcpa9qqehnuqst7qhfv.private,
        amount: 80u64.private,
        is_winner: false.private,
        _nonce: 4616969365873901328132194823203805499106223754935324867663590682527501419379group.public
        }' --program sandabgc_leo_mulbidder_auction --broadcast
        ```
        <details><summary> Detailed Output </summary><blockquote>

        ~~~
        Base execution cost for 'sandabgc_leo_mulbidder_auction' is 0.00223 credits.

        +--------------------------------+----------------+
        | sandabgc_leo_mulbidder_auction | Cost (credits) |
        +--------------------------------+----------------+
        | Transaction Storage            | 0.002230       |
        +--------------------------------+----------------+
        | On-chain Execution             | 0.000000       |
        +--------------------------------+----------------+
        | Priority Fee                   | 0.000000       |
        +--------------------------------+----------------+
        | Total                          | 0.002230       |
        +--------------------------------+----------------+

        Your current public balance is 36.97556 credits.

        ? Do you want to submit execution of function `resolve` on program `sandabgc_leo_mulbidder_auction.aleo` to network testnet via endpoint https://api.explorer.provable.com/v1 using address aleo1jtytwx08t49pzupghcwrdf99q44q0a002fx5
        ✔ Do you want to submit execution of function `resolve` on program `sandabgc_leo_mulbidder_auction.aleo` to network testnet via endpoint https://api.explorer.provable.com/v1 using address aleo1jtytwx08t49pzupghcwrdf99q44q0a002fx5na6mpsx08y7xpqrsfrf6sx? · yes
        ✅ Created execution transaction for 'sandabgc_leo_mulbidder_auction.aleo'

        Broadcasting transaction to https://api.explorer.provable.com/v1/testnet/transaction/broadcast...

        ⌛ Execution at1vgh987pd780y3vfalgc5rttf9cknwvmedwykc66e04hansdz9u8qxd440g ('sandabgc_leo_mulbidder_auction') has been broadcast to https://api.explorer.provable.com/v1/testnet/transaction/broadcast.
        ~~~

        </blockquote></details>
- On-Chain Outputs:
    - Transaction ID: `at1vgh987pd780y3vfalgc5rttf9cknwvmedwykc66e04hansdz9u8qxd440g`
    - Encrypted Record: 
        ```sh
        record1qyqspazpk5gllhjjmljt7wzjmrgc43f0ncuqy35h0x5hh0dr0flzz2qyqvrxy6tyv3jhyscqqgpqp3ue3h96452xuyfakv3jcpdexut4wx9p9tygwk6dltdrern46hcdz4tje34dt2h73ym99qf9gryt0fj3er0ctfdxlrnrhfx9uy8leqrsvctdda6kuaprqqpqzqrmsdn6crjlynpjatw6zznlgg5kme9he4tq0wmclkw9nh30ufgdqgykju6lwa5kumn9wg3sqqspqr8cdq4vptsgrmuw9wgrp4qkxpn82zrmrsvkg3k9sr6v9tt5vtmqn45cj7eghz82j0r3320hn35eraucw3thhfj35mpg8v2rc3nxc5qgtcwvqf
        ```
- Decrypt for Resolve:
    ```sh
    snarkos developer decrypt -v <redacted> -c record1qyqspazpk5gllhjjmljt7wzjmrgc43f0ncuqy35h0x5hh0dr0flzz2qyqvrxy6tyv3jhyscqqgpqp3ue3h96452xuyfakv3jcpdexut4wx9p9tygwk6dltdrern46hcdz4tje34dt2h73ym99qf9gryt0fj3er0ctfdxlrnrhfx9uy8leqrsvctdda6kuaprqqpqzqrmsdn6crjlynpjatw6zznlgg5kme9he4tq0wmclkw9nh30ufgdqgykju6lwa5kumn9wg3sqqspqr8cdq4vptsgrmuw9wgrp4qkxpn82zrmrsvkg3k9sr6v9tt5vtmqn45cj7eghz82j0r3320hn35eraucw3thhfj35mpg8v2rc3nxc5qgtcwvqf
    ```
    <details><summary> Detailed Output </summary><blockquote>

        ~~~
        {
        owner: aleo1jtytwx08t49pzupghcwrdf99q44q0a002fx5na6mpsx08y7xpqrsfrf6sx.private,
        bidder: aleo1pamgdq88tvutdl27yrvyzangzya3e8qjdjwcrayrdmaeh8yd5cxqfj3kfh.private,
        amount: 160u64.private,
        is_winner: false.private,
        _nonce: 3760598713037471907086855411277157836521418282815365195280773499491156728022group.public
        }
        ~~~

    </blockquote></details>

#### Finish Bid:
- Keep same `.env` as we are running as owner.
- Run `finish` transaction:
    - Code Snippet:
        ```sh
        leo execute finish <Output_Of_Resolve_Bid> --program <Program_name> --broadcast
        ```
    
    - Command:
        ```sh
        leo execute finish ' {
        owner: aleo1jtytwx08t49pzupghcwrdf99q44q0a002fx5na6mpsx08y7xpqrsfrf6sx.private,
        bidder: aleo1pamgdq88tvutdl27yrvyzangzya3e8qjdjwcrayrdmaeh8yd5cxqfj3kfh.private,
        amount: 160u64.private,
        is_winner: false.private,
        _nonce: 3760598713037471907086855411277157836521418282815365195280773499491156728022group.public
        }' --program sandabgc_leo_mulbidder_auction --broadcast
        ```
        <details><summary> Detailed Output </summary><blockquote>

        ~~~
        Base execution cost for 'sandabgc_leo_mulbidder_auction' is 0.00202 credits.

        +--------------------------------+----------------+
        | sandabgc_leo_mulbidder_auction | Cost (credits) |
        +--------------------------------+----------------+
        | Transaction Storage            | 0.002020       |
        +--------------------------------+----------------+
        | On-chain Execution             | 0.000000       |
        +--------------------------------+----------------+
        | Priority Fee                   | 0.000000       |
        +--------------------------------+----------------+
        | Total                          | 0.002020       |
        +--------------------------------+----------------+

        Your current public balance is 36.97354 credits.

        ? Do you want to submit execution of function `finish` on program `sandabgc_leo_mulbidder_auction.aleo` to network testnet via endpoint https://api.explorer.provable.com/v1 using address aleo1jtytwx08t49pzupghcwrdf99q44q0a002fx5n
        ✔ Do you want to submit execution of function `finish` on program `sandabgc_leo_mulbidder_auction.aleo` to network testnet via endpoint https://api.explorer.provable.com/v1 using address aleo1jtytwx08t49pzupghcwrdf99q44q0a002fx5na6mpsx08y7xpqrsfrf6sx? · yes
        ✅ Created execution transaction for 'sandabgc_leo_mulbidder_auction.aleo'

        Broadcasting transaction to https://api.explorer.provable.com/v1/testnet/transaction/broadcast...

        ⌛ Execution at1fglcqn65h0rg5ztp29xd0drjqgtsnh9xtq9at9kfyjtd8arrlg9qvj87kq ('sandabgc_leo_mulbidder_auction') has been broadcast to https://api.explorer.provable.com/v1/testnet/transaction/broadcast.
        ~~~

        </blockquote></details>

- On-Chain Outputs:
    - Transaction ID: `at1fglcqn65h0rg5ztp29xd0drjqgtsnh9xtq9at9kfyjtd8arrlg9qvj87kq`
    - Encrypted Record: 
        ```sh
        record1qyqspkystg7nd7986esctxtgwegnvm0ya343g0rc22pjkle9jj6f92c0qvrxy6tyv3jhyscqqgpqprtnnsm4f2jeaaq0qq08z3grp2z3va7uws5ljf20wggq6w6xurqxrt4nlzhfeqsuy06w46f2fg5v6sldvrs2d8dyezr0pcxgmu7rvq9qvctdda6kuaprqqpqzqzfqmlz03uav0f4r9wt85w4mwwy9zmdu0xdqush909925xex8mmqyykju6lwa5kumn9wg3sqqspqqf30na8z6yr3x3aftkpjw2q3czhqmye9dkslrynxxyknwcyv6nsnlj86dk9alewusm83428xh8fy9rgeujr3fslup4d5maqpg2w93s2d2aupe
        ```
- Decrypt for Resolve:
    ```sh
    snarkos developer decrypt -v <redacted> -c record1qyqspkystg7nd7986esctxtgwegnvm0ya343g0rc22pjkle9jj6f92c0qvrxy6tyv3jhyscqqgpqprtnnsm4f2jeaaq0qq08z3grp2z3va7uws5ljf20wggq6w6xurqxrt4nlzhfeqsuy06w46f2fg5v6sldvrs2d8dyezr0pcxgmu7rvq9qvctdda6kuaprqqpqzqzfqmlz03uav0f4r9wt85w4mwwy9zmdu0xdqush909925xex8mmqyykju6lwa5kumn9wg3sqqspqqf30na8z6yr3x3aftkpjw2q3czhqmye9dkslrynxxyknwcyv6nsnlj86dk9alewusm83428xh8fy9rgeujr3fslup4d5maqpg2w93s2d2aupe
    ```
    <details><summary> Detailed Output </summary><blockquote>

    ~~~
    {
    owner: aleo1pamgdq88tvutdl27yrvyzangzya3e8qjdjwcrayrdmaeh8yd5cxqfj3kfh.private,
    bidder: aleo1pamgdq88tvutdl27yrvyzangzya3e8qjdjwcrayrdmaeh8yd5cxqfj3kfh.private,
    amount: 160u64.private,
    is_winner: true.private,
    _nonce: 4874524539651214831549581042383976313351810152937072746200061665544728954878group.public
    }
    ~~~

    </blockquote></details>
- According to above outputs, a/c with `Address`: `aleo1pamgdq88tvutdl27yrvyzangzya3e8qjdjwcrayrdmaeh8yd5cxqfj3kfh` is the winner.

## Claim Bid:
- Now, the value of `PRIVATE_KEY` in `.env` must be replaced with the `PRIVATE_KEY` of the owner `aleo1pamgdq88tvutdl27yrvyzangzya3e8qjdjwcrayrdmaeh8yd5cxqfj3kfh`.
- Run `claim` transaction:
    - Code Snippet:
        ```sh
        leo execute claim <Finish_Bid> --program <Program_name> --broadcast
        ```
    
    - Command:
        ```sh
        leo execute claim '{
        owner: aleo1pamgdq88tvutdl27yrvyzangzya3e8qjdjwcrayrdmaeh8yd5cxqfj3kfh.private,
        bidder: aleo1pamgdq88tvutdl27yrvyzangzya3e8qjdjwcrayrdmaeh8yd5cxqfj3kfh.private,
        amount: 160u64.private,
        is_winner: true.private,
        _nonce: 4874524539651214831549581042383976313351810152937072746200061665544728954878group.public
        }' --program sandabgc_leo_mulbidder_auction --broadcast -y
        ```
        <details><summary> Detailed Output </summary><blockquote>

        ~~~
        Base execution cost for 'sandabgc_leo_mulbidder_auction' is 0.001896 credits.

        +--------------------------------+----------------+
        | sandabgc_leo_mulbidder_auction | Cost (credits) |
        +--------------------------------+----------------+
        | Transaction Storage            | 0.001896       |
        +--------------------------------+----------------+
        | On-chain Execution             | 0.000000       |
        +--------------------------------+----------------+
        | Priority Fee                   | 0.000000       |
        +--------------------------------+----------------+
        | Total                          | 0.001896       |
        +--------------------------------+----------------+

        Your current public balance is 15.025888 credits.

        ✅ Created execution transaction for 'sandabgc_leo_mulbidder_auction.aleo'

        Broadcasting transaction to https://api.explorer.provable.com/v1/testnet/transaction/broadcast...

        ⌛ Execution at13ynnq3dq0g8gs6sgq2ntfy27k6hars7t9maata7n52s3hztr5urql825mx ('sandabgc_leo_mulbidder_auction') has been broadcast to https://api.explorer.provable.com/v1/testnet/transaction/broadcast.
        ~~~

        </blockquote></details>
- On-Chain Outputs:
    - Transaction ID: `at13ynnq3dq0g8gs6sgq2ntfy27k6hars7t9maata7n52s3hztr5urql825mx`
    - Encrypted Record: 
        ```sh
        record1qyqspdrf70wkk7gtx9pdk0xpe266kmgz6wxyp05s6mhum2y52q9d33g8qyrxzmt0w4h8ggcqqgqspv2ngvmn739sd8xvsrkmfj46uk9zfh5696gt663gwdpngmwgmmgrnd286ss7ky5uus202tyynal9mjm3wtngnnmg8u7ys95arcuu7cqs8pka9l
        ```
- Decrypt for Resolve:
    ```sh
    snarkos developer decrypt -v <redacted> -c record1qyqspdrf70wkk7gtx9pdk0xpe266kmgz6wxyp05s6mhum2y52q9d33g8qyrxzmt0w4h8ggcqqgqspv2ngvmn739sd8xvsrkmfj46uk9zfh5696gt663gwdpngmwgmmgrnd286ss7ky5uus202tyynal9mjm3wtngnnmg8u7ys95arcuu7cqs8pka9l
    ```
    <details><summary> Detailed Output </summary><blockquote>

    ~~~
    {
    owner: aleo1pamgdq88tvutdl27yrvyzangzya3e8qjdjwcrayrdmaeh8yd5cxqfj3kfh.private,
    amount: 160u64.private,
    _nonce: 888040040910413689245654018949841677706811718678551929866008188353683215515group.public
    }
    ~~~

    </blockquote></details>
- According to above outputs, a/c with `Address`: `aleo1pamgdq88tvutdl27yrvyzangzya3e8qjdjwcrayrdmaeh8yd5cxqfj3kfh` is the owner.

## Sign In Signature:
- Code Snippet:
    ```sh
     leo account sign --private-key <PRIVATE_KEY> --message <MESSAGE> --raw
    ```
- Here:
    - `PRIVATE_KEY`: Must be the program deployed with.
    - `MESSAGE`: Message we want to sign in with.

### Signature with message `true`:
- Command:
    ```sh
    leo account sign --private-key <redacted> --message true
    ```

- Output:
    ```sh
    sign1a4ptesckvmagvm6mezngs2clcrhpqlf3qrpwr2k5rcc6nr6wysqsjsr89y3cp2j5g6vuh65seak2t68qsf8xdnsavqqtaazy6vyajqdzagrt29qtpw7qxv39ajtn8yxgyk093n6ah79jvpv2l3kfnalnz9kryey36lgje05a8hr7qzv6zl3mgpr6qrkvuvd62hpf0233gahpytqn0e7
    ```

### Sign with `Transaction ID`:
- For me, program deployed Transaction ID is: `at1jc4p0tjy36murvlcsq6l0u2y4sjgkdtjk55m9nrrgm2sdkw4jcfq44nvwg`. Command:
    ```sh
    leo account sign -d --private-key <redacted> --message "at1jc4p0tjy36murvlcsq6l0u2y4sjgkdtjk55m9nrrgm2sdkw4jcfq44nvwg" --raw
    ```
- Output:
    ```sh
    sign1leyqx3y5as2g6erkzxw7ccqp9mk2nacdu4t8a4t6g0fa7zxatgpt0299tzm6fh49rj4cawyks5kqssjmc4yxjalxsny9jqsxu3z3zq4zagrt29qtpw7qxv39ajtn8yxgyk093n6ah79jvpv2l3kfnalnz9kryey36lgje05a8hr7qzv6zl3mgpr6qrkvuvd62hpf0233gahpy6txylt
    ```