use std::io::{self, Write};

fn is_increasing_digits(mut number: u32) -> bool {
    let mut prev_digit = 10; // Начальное значение больше любой цифры (0-9)
    let mut digit_count = 0;

    while number > 0 {
        let digit = number % 10;
        digit_count += 1;

        if digit >= prev_digit {
            return false;
        }
        prev_digit = digit;
        number /= 10;
    }

    digit_count > 1
}

fn reverse_number(mut number: u32) -> u32 {
    let mut reversed = 0;

    while number > 0 {
        let digit = number % 10;
        reversed = reversed * 10 + digit;
        number /= 10;
    }

    reversed
}

fn main() {
    println!("Введите последовательность чисел через пробел:");

    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    let numbers: Vec<u32> = input
        .trim()
        .split_whitespace()
        .filter_map(|s| s.parse::<u32>().ok())
        .collect();

    let mut result: Vec<u32> = Vec::new();

    for &number in &numbers {
        if is_increasing_digits(number) {
            result.push(reverse_number(number));
        }
    }

    if result.is_empty() {
        println!("Искомых чисел не найдено!");
    } else {
        println!(
            "Результат: {}",
            result.iter().map(|n| n.to_string()).collect::<Vec<_>>().join(" ")
        );
    }
}
