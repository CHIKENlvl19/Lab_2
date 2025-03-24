use std::io::{self, BufRead};

fn is_cyclic_shift(s: &str, t: &str) -> bool {
    if s.len() != t.len() { // Проверяем, равны ли длины строк
        return false;
    }

    let doubled_s = format!("{}{}", s, s); // Создаем строку S+S

    doubled_s.contains(t) // Проверяем, содержится ли T в S+S
}

fn main() {
    let stdin = io::stdin();
    let mut lines = stdin.lock().lines();

    println!("Введите строку S:"); // Считываем первую строку S
    let s = match lines.next() {
        Some(Ok(line)) => line,
        _   {
            println!("Ошибка при вводе строки S.");
            return;
        }
    };

    println!("Введите строку T:"); // Считываем вторую строку T
    let t = match lines.next() {
        Some(Ok(line)) => line,
        _ => {
            println!("Ошибка при вводе строки T.");
            return;
        }
    };

    if is_cyclic_shift(&s, &t) { // Проверяем, является ли T циклическим сдвигом S
        println!("Yes");
    } else {
        println!("No");
    }
}