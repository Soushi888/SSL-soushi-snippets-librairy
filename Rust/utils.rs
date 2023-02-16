fn get_capitalized_first_letter(str: &str) -> String {
    let mut chars = str.chars();
    let first_char = match chars.next() {
        None => String::new(),
        Some(f) => f.to_uppercase().collect::<String>(),
    };

    first_char
}

fn split_by_uppercase(s: &str) -> Vec<&str> {
    let re = Regex::new(r"([A-Z][a-z]+)").unwrap();
    re.find_iter(s).map(|m| m.as_str()).collect()
}