use std::fs;
fn main() {
    let contents = fs::read_to_string("testwords.txt").unwrap();
    let v: Vec<&str> = contents.split('\n').collect();
    for item in v {
        println!("{}", item);
    }
}
