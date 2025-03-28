package main

import (
    "bufio"
    "fmt"
    "os"
    "strconv"
    "strings"
)

func isNumberIncreasing(number int) bool {
    if number/10 < 1 {
        return false
    }
    digits := []int{}

    for number > 0 {
        digits = append(digits, number%10)
        number /= 10
    }

    for i, j := 0, len(digits)-1; i < j; i, j = i+1, j-1 {
        digits[i], digits[j] = digits[j], digits[i]
    }

    for i := 1; i < len(digits); i++ {
        if digits[i] <= digits[i-1] {
            return false
        }
    }

    return true
}

func reverseNumber(number int) int {
    digits := []int{}
    for number > 0 {
        digits = append(digits, number%10)
        number /= 10
    }

    reversedNumber := 0
    for _, digit := range digits {
        reversedNumber = reversedNumber*10 + digit
    }
    return reversedNumber
}

func main() {
    fmt.Println("¬ведите числа, которые хотите проверить через пробел (Ctrl+D дл€ окончани€):")
    scanner := bufio.NewScanner(os.Stdin)
    numbers := []int{}

    for scanner.Scan() {
        line := scanner.Text()
        for _, numStr := range strings.Fields(line) {
            if num, err := strconv.Atoi(numStr); err == nil {
                numbers = append(numbers, num)
            }
        }
    }

    fmt.Println()
    countSuccess := 0
    for _, n := range numbers {
        if isNumberIncreasing(n) {
            fmt.Printf("%d ", reverseNumber(n))
            countSuccess++
        }
    }

    if countSuccess == 0 {
        fmt.Println("»скомых чисел не найдено!")
    }
}