package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

func findFinalDestination(routes [][2]string) string {
    graph := make(map[string]string)
    destinations := make(map[string]bool)

    for _, route := range routes {
        start, end := route[0], route[1]
        graph[start] = end
        destinations[end] = true
    }

    starts := []string{}
    for _, route := range routes {
        start := route[0]
        if !destinations[start] {
            starts = append(starts, start)
        }
    }

    if len(starts) == 0 {
        return "обратитесь к специалисту"
    }

    var finalDestination string
    maxLength := 0

    for _, start := range starts {
        current := start
        length := 1

        for {
            next, ok := graph[current]
            if !ok {
                break
            }
            current = next
            length++
        }

        if length > maxLength {
            maxLength = length
            finalDestination = current
        }
    }

    if maxLength == 1 && finalDestination == graph[finalDestination] {
        return "обратитесь к специалисту"
    }

    return finalDestination
}

func main() {
    routes := [][2]string{}
    scanner := bufio.NewScanner(os.Stdin)

    fmt.Println("Введите пары маршрутов в формате 'начальный пункт конечный пункт'.")
    fmt.Println("Для завершения ввода введите пустую строку.")

    for {
        fmt.Print("Введите маршрут: ")
        scanner.Scan()
        input := strings.TrimSpace(scanner.Text())
        if input == "" {
            break
        }

        parts := strings.Split(input, " ")
        if len(parts) == 2 {
            routes = append(routes, [2]string{parts[0], parts[1]})
        } else {
            fmt.Println("Некорректный ввод. Попробуйте снова.")
        }
    }

    result := findFinalDestination(routes)
    fmt.Printf("\n%s\n", result)
}