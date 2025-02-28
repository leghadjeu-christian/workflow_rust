use std::env;

fn main() {
    // Access the parameters passed to the GitHub Action
    let param1 = env::var("INPUT_PARAM1").unwrap_or_else(|_| String::from("default_value1"));
    let param2 = env::var("INPUT_PARAM2").unwrap_or_else(|_| String::from("default_value2"));

    println!("Parameter 1: {}", param1);
    println!("Parameter 2: {}", param2);

    // Your logic here
}
