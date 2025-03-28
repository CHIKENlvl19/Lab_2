fun isNumberIncreasing(number: Int): Boolean {
    if (number / 10 < 1) return false
    val digits = mutableListOf<Int>()

    var n = number
    while (n > 0) {
        digits.add(n % 10)
        n /= 10
    }

    digits.reverse()
    for (i in 1 until digits.size) {
        if (digits[i] <= digits[i - 1]) return false
    }

    return true
}

fun reverseNumber(number: Int): Int {
    val digits = mutableListOf<Int>()
    var n = number
    while (n > 0) {
        digits.add(n % 10)
        n /= 10
    }

    var reversedNumber = 0
    for (digit in digits) {
        reversedNumber = reversedNumber * 10 + digit
    }
    return reversedNumber
}

fun main() {
    println("¬ведите числа, которые хотите проверить через пробел (Ctrl+D дл€ окончани€):")
    val numbers = mutableListOf<Int>()
    while (true) {
        val input = readLine() ?: break
        numbers.addAll(input.split(" ").mapNotNull { it.toIntOrNull() })
    }

    println()
    var countSuccess = 0
    for (n in numbers) {
        if (isNumberIncreasing(n)) {
            print("${reverseNumber(n)} ")
            countSuccess++
        }
    }

    if (countSuccess == 0) {
        println("»скомых чисел не найдено!")
    }
}