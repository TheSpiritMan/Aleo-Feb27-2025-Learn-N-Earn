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