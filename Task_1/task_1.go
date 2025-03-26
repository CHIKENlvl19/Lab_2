package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

func isCyclicShift(s, t string) bool {
    // Проверяем, равны ли длины строк
    if len(s) != len(t) {
        return false
    }

    // Создаем строку S+S
    doubledS := s + s

    // Проверяем, содержится ли T в S+S
    return strings.Contains(doubledS, t)
}

func main() {
    // Инициализируем сканер для чтения ввода с клавиатуры
    scanner := bufio.NewScanner(os.Stdin)

    // Считываем строку S
    fmt.Println("Введите строку S:")
    scanner.Scan()
    s := scanner.Text()
    if s == "" {
        fmt.Println("Ошибка при вводе строки S.")
        return
    }

    // Считываем строку T
    fmt.Println("Введите строку T:")
    scanner.Scan()
    t := scanner.Text()
    if t == "" {
        fmt.Println("Ошибка при вводе строки T.")
        return
    }

    // Проверяем, является ли T циклическим сдвигом S
    if isCyclicShift(s, t) {
        fmt.Println("Yes")
    } else {
        fmt.Println("No")
    }
}
