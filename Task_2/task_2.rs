use std::collections::{HashMap, HashSet};
use std::io::{self, Write};

fn find_final_destination(routes: Vec<(String, String)>) -> String {
    let mut graph: HashMap<String, String> = HashMap::new();
    let mut destinations: HashSet<String> = HashSet::new();

    // Заполняем граф и множество пунктов назначения
    for (start, end) in routes.iter() {
        graph.insert(start.clone(), end.clone());
        destinations.insert(end.clone());
    }

    // Находим все начальные пункты
    let starts: HashSet<String> = routes
        .iter()
        .map(|(start, _)| start.clone())
        .filter(|start| !destinations.contains(start))
        .collect();

    if starts.is_empty() {
        return "обратитесь к специалисту".to_string();
    }

    let mut final_destination = String::new();
    let mut max_length = 0;

    // Находим самую длинную цепочку
    for start in starts.iter() {
        let mut current = start.clone();
        let mut length = 1;

        while let Some(next) = graph.get(&current) {
            current = next.clone();
            length += 1;
        }

        if length > max_length {
            max_length = length;
            final_destination = current;
        }
    }

    // Обработка случая с циклом из одного пункта
    if max_length == 1 && graph.get(&final_destination) == Some(&final_destination) {
        return "обратитесь к специалисту".to_string();
    }

    final_destination
}

fn main() {
    println!("Введите пары маршрутов в формате 'начальный пункт конечный пункт'.");
    println!("Для завершения ввода введите пустую строку.");

    let mut routes: Vec<(String, String)> = Vec::new();

    loop {
        print!("Введите маршрут: ");
        io::stdout().flush().unwrap(); // Чтобы вывод был немедленным

        let mut input = String::new();
        io::stdin().read_line(&mut input).unwrap();
        let input = input.trim();

        if input.is_empty() {
            break;
        }

        let parts: Vec<&str> = input.split_whitespace().collect();
        if parts.len() == 2 {
            routes.push((parts[0].to_string(), parts[1].to_string()));
        } else {
            println!("Некорректный ввод. Попробуйте снова.");
        }
    }

    let result = find_final_destination(routes);
    println!("\nИтоговый результат: {}", result);
}