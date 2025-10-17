fn main() {
    let pushed_items: i32 = std::env::args().collect::<Vec<String>>()[1]
        .parse::<i32>()
        .unwrap();
    println!("Testing a push/pop with {} allocated items.", pushed_items);

    let mut myvec: Vec<String> = vec![];
    for n in 0..pushed_items {
        myvec.push(n.to_string());
    }

    for _ in 0..pushed_items {
        myvec.pop();
    }
}
