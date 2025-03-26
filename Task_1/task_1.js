function isCyclicShift(s, t) {
    // Проверяем, равны ли длины строк
    if (s.length !== t.length) {
        return false;
    }

    // Создаем строку S+S
    const doubledS = s + s;

    // Проверяем, содержится ли T в S+S
    return doubledS.includes(t);
}

// Функция для чтения ввода с клавиатуры
function readLine(prompt) {
    return prompt ? prompt.trim() : null;
}

function main() {
    // Считываем строки S и T с помощью prompt
    const s = readLine(prompt("Введите строку S:"));
    if (!s) {
        console.log("Ошибка при вводе строки S.");
        return;
    }

    const t = readLine(prompt("Введите строку T:"));
    if (!t) {
        console.log("Ошибка при вводе строки T.");
        return;
    }

    // Проверяем, является ли T циклическим сдвигом S
    if (isCyclicShift(s, t)) {
        console.log("Yes");
    } else {
        console.log("No");
    }
}

// Запускаем программу
main();