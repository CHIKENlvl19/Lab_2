import Foundation

func isCyclicShift(_ s: String, _ t: String) -> Bool {
    // Проверяем, равны ли длины строк
    if s.count != t.count {
        return false
    }

    // Создаем строку S+S
    let doubledS = s + s

    // Проверяем, содержится ли T в S+S
    return doubledS.contains(t)
}

// Функция для чтения ввода с клавиатуры
func readLine(prompt: String) -> String? {
    print(prompt, terminator: "")
    return readLine()
}

func main() {
    // Считываем строки S и T с клавиатуры
    guard let s = readLine(prompt: "Введите строку S: "), !s.isEmpty else {
        print("Ошибка при вводе строки S.")
        return
    }

    guard let t = readLine(prompt: "Введите строку T: "), !t.isEmpty else {
        print("Ошибка при вводе строки T.")
        return
    }

    // Проверяем, является ли T циклическим сдвигом S
    if isCyclicShift(s, t) {
        print("Yes")
    } else {
        print("No")
    }
}

main()