# Getting Started with Leo

## Create Project
- Command:
    ```sh
    leo new find_max_element
    ```

- main.leo:
    ```sh
    // The 'find_max_element' program.
    program find_max_element.aleo {
        transition max(data: [u8; 10]) -> u8 {
            let m: u8 = data[0u8];
            for i: u8 in 1u8..10u8 {
                if data[i] > m {
                    m = data[i];
                }
            }
            return m;
        }
    }
    ```

## Leo Run Command:
- Command:
    ```sh
    leo run max [1u8,2u8,3u8,4u8,5u8,6u8,17u8,8u8,9u8,10u8]
    ```

    Output:
    ```sh
    Leo ✅ Compiled 'find_max_element.aleo' into Aleo instructions
    ⛓  Constraints
    •  'find_max_element.aleo/max' - 162 constraints (called 1 time)
    ➡️  Output
    • 17u8
    ```