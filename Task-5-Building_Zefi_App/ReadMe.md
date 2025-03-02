# Building Zefi App

## Create new leo Project:
```sh
leo new sandabgc_token_vesting_linear
```

## Setup project:
```sh
cd sandabgc_token_vesting_linear
leo add token_registry
leo add credits
```

## Modified `main.leo`:
- Paste below contents inside `main.leo` but change value of address with your public address.:

    <details><summary> Detailed Output </summary><blockquote>

    ~~~sh
    // The 'sandabgc_token_vesting_linear' program.
    import token_registry.aleo;
    import credits.aleo;

    program sandabgc_token_vesting_linear.aleo {
        const ADMIN: address = aleo1jtytwx08t49pzupghcwrdf99q44q0a002fx5na6mpsx08y7xpqrsfrf6sx;

        record AccessRecord {
            owner:address,
        }

        struct TokenMetadata {
            token_id: field,
            name: u128,
            symbol: u128,
            decimals: u8,
            supply: u128,
            max_supply: u128,
            admin: address,
            external_authorization_required: bool,
            external_authorization_party: address
        }

        struct BeneficiaryMetadata {
            block_duration: u32,
            start_height: u32,
            number_of_interval: u32,
            total_amount: u128,
            claimed_amount: u128,
            token_id: field,  
        }
        mapping beneficiary_metadata:address => BeneficiaryMetadata;

        transition issue_access_record (to:address) -> AccessRecord {
            assert_eq(self.caller, ADMIN);
            return AccessRecord {
                owner: to
            };
        }


        mapping registered_token:field => bool;

        async transition register_token (token_id:field) -> Future {
            assert_eq(self.caller,ADMIN);
            return finalize_register_token(token_id);
        }

        async function finalize_register_token (token_id:field) {
            let token:TokenMetadata = token_registry.aleo/registered_tokens.get(token_id);
            let registered: bool = registered_token.get_or_use(token_id,false);
            assert(!registered);
            registered_token.set(token_id,true);
        }

        async transition deposit(beneficiary:address,amount:u128, block_duration:u32, start_height:u32, number_of_interval:u32, token_id:field ) -> Future {
            assert_eq(self.caller, ADMIN);
            let deposited:Future=token_registry.aleo/transfer_public(token_id, self.address, amount);
            let beneficiary_hash_address:address = BHP256::hash_to_address(beneficiary);
            return finalize_deposit(amount, beneficiary_hash_address , block_duration, start_height, number_of_interval,token_id,  deposited);
        }

        async function finalize_deposit (amount:u128, beneficiary: address, block_duration:u32, start_height:u32, number_of_interval:u32, token_id:field, deposited:Future) {
            deposited.await();
            let token:bool = registered_token.get(token_id);
            let metadata:BeneficiaryMetadata = beneficiary_metadata.get_or_use(beneficiary, BeneficiaryMetadata {
                block_duration: 0u32,
                start_height: 0u32,
                number_of_interval: 0u32,
                total_amount: 0u128,
                claimed_amount: 0u128,
                token_id: token_id
            });
            let total_amount:u128 = metadata.total_amount + amount;
            assert(start_height > block.height);
            beneficiary_metadata.set(beneficiary, BeneficiaryMetadata {
                block_duration: block_duration,
                start_height: start_height,
                number_of_interval: number_of_interval,
                total_amount: total_amount,
                claimed_amount: metadata.claimed_amount,
                token_id: token_id
            });
        
        }


        async transition claim(access_record: AccessRecord, amount:u128, token_id: field, external_authorization_required: bool) -> (token_registry.aleo/Token, AccessRecord,Future) {
            let (token_record,transfer):(token_registry.aleo/Token, Future)=token_registry.aleo/transfer_public_to_private(token_id, access_record.owner, amount, external_authorization_required);
            let beneficiary_hash_address:address = BHP256::hash_to_address(access_record.owner);
            let new_access_record:AccessRecord = AccessRecord {
                owner: access_record.owner
            };
            return (token_record, new_access_record, finalize_claim(amount, token_id, beneficiary_hash_address, transfer));
        }

        async function finalize_claim (amount:u128, token_id:field, beneficiary:address, transfer:Future) {
            transfer.await();
            let metadata:BeneficiaryMetadata = beneficiary_metadata.get(beneficiary);
            let claimed_amount:u128 = metadata.claimed_amount + amount;
            assert(claimed_amount <= metadata.total_amount);
            assert(block.height > metadata.start_height);
            assert((block.height - metadata.start_height)> (metadata.block_duration / metadata.number_of_interval));
            assert(amount == (metadata.total_amount * metadata.number_of_interval as u128 / metadata.block_duration as u128));
            beneficiary_metadata.set(beneficiary, BeneficiaryMetadata {
                block_duration: metadata.block_duration,
                start_height: metadata.start_height,
                number_of_interval: metadata.number_of_interval,
                total_amount: metadata.total_amount,
                claimed_amount: claimed_amount,
                token_id: metadata.token_id
            });
        }

    }
    ~~~

    </blockquote></details>

## Deploy Project:
- Command:
    ```sh
    leo deploy --network testnet -y
    ```
    <details><summary> Detailed Output </summary><blockquote>

    ~~~sh

    Leo ✅ Compiled 'sandabgc_token_vesting_linear.aleo' into Aleo instructions
    📦 Creating deployment transaction for 'sandabgc_token_vesting_linear.aleo'...


    Base deployment cost for 'sandabgc_token_vesting_linear.aleo' is 13.1285 credits.

    +------------------------------------+----------------+
    | sandabgc_token_vesting_linear.aleo | Cost (credits) |
    +------------------------------------+----------------+
    | Transaction Storage                | 5.336000       |
    +------------------------------------+----------------+
    | Program Synthesis                  | 6.792500       |
    +------------------------------------+----------------+
    | Namespace                          | 1.000000       |
    +------------------------------------+----------------+
    | Priority Fee                       | 0.000000       |
    +------------------------------------+----------------+
    | Total                              | 13.128500      |
    +------------------------------------+----------------+

    Your current public balance is 176.493721 credits.

    ✅ Created deployment transaction for 'sandabgc_token_vesting_linear.aleo'

    Broadcasting transaction to https://api.explorer.provable.com/v1/testnet/transaction/broadcast...

    ⌛ Deployment at188dzpnrrmu7yl353e3x50dh0fkrkcmjgp0v2nmehcxxefnmh9v8qwpf8tl ('sandabgc_token_vesting_linear.aleo') has been broadcast to https://api.explorer.provable.com/v1/testnet/transaction/broadcast.
    ~~~

    </blockquote></details>

- On-Chain Outputs:
    - Transaction ID: `at188dzpnrrmu7yl353e3x50dh0fkrkcmjgp0v2nmehcxxefnmh9v8qwpf8tl`
    - Aleo Program: [https://testnet.aleo.info/program/sandabgc_token_vesting_linear.aleo](https://testnet.aleo.info/program/sandabgc_token_vesting_linear.aleo)
    - Deploy Txn: [https://testnet.aleo.info/transaction/at188dzpnrrmu7yl353e3x50dh0fkrkcmjgp0v2nmehcxxefnmh9v8qwpf8tl](https://testnet.aleo.info/transaction/at188dzpnrrmu7yl353e3x50dh0fkrkcmjgp0v2nmehcxxefnmh9v8qwpf8tl) 

## Sign with `Transaction ID`:
- For me, program deployed Transaction ID is: `at188dzpnrrmu7yl353e3x50dh0fkrkcmjgp0v2nmehcxxefnmh9v8qwpf8tl`. Command:
    ```sh
    leo account sign -d --private-key <redacted> --message "at188dzpnrrmu7yl353e3x50dh0fkrkcmjgp0v2nmehcxxefnmh9v8qwpf8tl" --raw
    ```
- Output:
    ```sh
    sign1p0lvk874eja4zerum03kd7mqt5924vpt6remwyhf8n33f97k7vp2mrjsrk9rr7pj2u2td2x3e3fx7hgtza0n6xj6eus635ruk8r8zq4zagrt29qtpw7qxv39ajtn8yxgyk093n6ah79jvpv2l3kfnalnz9kryey36lgje05a8hr7qzv6zl3mgpr6qrkvuvd62hpf0233gahpy4huxs7
    ```