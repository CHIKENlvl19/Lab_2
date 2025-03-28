function isNumberIncreasing(number: number): boolean {
    if (Math.floor(number / 10) < 1) return false;
    const digits: number[] = [];

    let n = number;
    while (n > 0) {
        digits.push(n % 10);
        n = Math.floor(n / 10);
    }

    digits.reverse();
    for (let i = 1; i < digits.length; i++) {
        if (digits[i] <= digits[i - 1]) return false;
    }

    return true;
}

function reverseNumber(number: number): number {
    const digits: number[] = [];
    let n = number;
    while (n > 0) {
        digits.push(n % 10);
        n = Math.floor(n / 10);
    }

    let reversedNumber = 0;
    for (const digit of digits) {
        reversedNumber = reversedNumber * 10 + digit;
    }
    return reversedNumber;
}

function main() {
    const input = prompt("Введите числа, которые хотите проверить через пробел:");
    if (!input) {
        alert("Вы не ввели данные!");
        return;
    }

    const numbers = input
        .split(" ")
        .map((numStr) => parseInt(numStr, 10))
        .filter((num) => !isNaN(num));

    let result = "";
    let countSuccess = 0;

    for (const n of numbers) {
        if (isNumberIncreasing(n)) {
            result += `${reverseNumber(n)} `;
            countSuccess++;
        }
    }

    if (countSuccess === 0) {
        alert("Искомых чисел не найдено!");
    } else {
        alert(`Результат: ${result.trim()}`);
    }
}

// Запускаем программу
main();