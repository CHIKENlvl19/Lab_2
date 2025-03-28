function isNumberIncreasing(number) {
    if (Math.floor(number / 10) < 1) return false;
    const digits = [];

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

function reverseNumber(number) {
    const digits = [];
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

console.log("¬ведите числа, которые хотите проверить через пробел (Ctrl+D дл€ окончани€):");
const readline = require("readline").createInterface({
    input: process.stdin,
    output: process.stdout,
});

const numbers = [];
readline.on("line", (line) => {
    numbers.push(...line.split(" ").map(Number).filter((n) => !isNaN(n)));
}).on("close", () => {
    console.log();
    let countSuccess = 0;
    for (const n of numbers) {
        if (isNumberIncreasing(n)) {
            process.stdout.write(`${reverseNumber(n)} `);
            countSuccess++;
        }
    }

    if (countSuccess === 0) {
        console.log("»скомых чисел не найдено!");
    }
});