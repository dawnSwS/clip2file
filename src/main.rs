#![windows_subsystem = "windows"]

use arboard::Clipboard;
use rand::Rng;
use std::env;
use std::fs::File;
use std::io::Write;
use std::path::PathBuf;
use std::process;

fn main() {
    let args: Vec<String> = env::args().collect();
    let target_dir = if args.len() > 1 {
        PathBuf::from(&args[1])
    } else {
        env::current_dir().unwrap_or_else(|_| PathBuf::from("."))
    };

    let mut clipboard = match Clipboard::new() {
        Ok(cb) => cb,
        Err(_) => process::exit(1),
    };

    let text = match clipboard.get_text() {
        Ok(t) => t,
        Err(_) => process::exit(1),
    };

    let mut rng = rand::thread_rng();
    let random_num: u64 = rng.gen();
    let digest = md5::compute(random_num.to_string());
    let filename = format!("{:x}.txt", digest);

    let filepath = target_dir.join(&filename);

    let mut file = match File::create(&filepath) {
        Ok(f) => f,
        Err(_) => process::exit(1),
    };

    if file.write_all(text.as_bytes()).is_err() {
        process::exit(1);
    }
}