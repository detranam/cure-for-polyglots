fn main() {
    let pushed_items: i32 = std::env::args().collect::<Vec<String>>()[1]
        .parse::<i32>()
        .unwrap();
    println!("Testing a push/pop with {} allocated items.", pushed_items);

    let mut evennumbercount = 0;
    let mut myvec: Vec<i32> = vec![];
    for n in 0..pushed_items {
        myvec.push(n);
    }

    for _ in 0..pushed_items {
        let thisint: i32 = myvec.pop().unwrap();
        if thisint % 2 == 0 {
            evennumbercount += 1;
        }
    }
    println!("There were {} even numbers.", evennumbercount);
}
