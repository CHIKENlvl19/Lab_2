import Foundation

func isNumberIncreasing(_ number: Int) -> Bool {
    if number / 10 < 1 { return false }
    var digits = [Int]()
    
    var n = number
    while n > 0 {
        digits.append(n % 10)
        n /= 10
    }
    
    digits.reverse()
    for i in 1..<digits.count {
        if digits[i] <= digits[i - 1] {
            return false
        }
    }
    
    return true
}

func reverseNumber(_ number: Int) -> Int {
    var digits = [Int]()
    var n = number
    while n > 0 {
        digits.append(n % 10)
        n /= 10
    }
    
    var reversedNumber = 0
    for digit in digits {
        reversedNumber = reversedNumber * 10 + digit
    }
    return reversedNumber
}

print("¬ведите числа, которые хотите проверить через пробел (Ctrl+D дл€ окончани€):")
var numbers = [Int]()
while let line = readLine() {
    numbers += line.split(separator: " ").compactMap { Int($0) }
}

print()
var countSuccess = 0
for n in numbers {
    if isNumberIncreasing(n) {
        print("\(reverseNumber(n)) ", terminator: "")
        countSuccess += 1
    }
}

if countSuccess == 0 {
    print("»скомых чисел не найдено!")
}