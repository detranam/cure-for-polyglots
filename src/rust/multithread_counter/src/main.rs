use std::sync::{Arc, Mutex};
use std::thread;

static COUNT_TO: i32 = 10000000;

fn main() {
    let global_counter = Arc::new(Mutex::new(0));
    let mut threads = vec![];
    let pushed_items: i32 = std::env::args().collect::<Vec<String>>()[1]
        .parse::<i32>()
        .unwrap();
    println!("Counting to {} with {} threads.", COUNT_TO, pushed_items);

    for _ in 0..pushed_items {
        let counter = Arc::clone(&global_counter);
        let handle = thread::spawn(move || {
            loop {
                let mut num = counter.lock().unwrap();
                if *num < COUNT_TO {
                    *num += 1;
                } else {
                    break;
                }
            }
        });
        threads.push(handle);
    }

    for handle in threads {
        handle.join().unwrap();
    }

    println!("Counter value: {}", *global_counter.lock().unwrap());
}
