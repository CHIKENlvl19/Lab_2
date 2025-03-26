function isCyclicShift(s: string, t: string): boolean {
    // Проверяем, равны ли длины строк
    if (s.length !== t.length) {
        return false;
    }

    // Создаем строку S+S
    const doubledS = s + s;

    // Проверяем, содержится ли T в S+S
    return doubledS.includes(t);
}

async function main() {
    // Считываем строки S и T с помощью prompt
    const s = prompt("Введите строку S:");
    if (!s) {
        alert("Ошибка при вводе строки S.");
        return;
    }

    const t = prompt("Введите строку T:");
    if (!t) {
        alert("Ошибка при вводе строки T.");
        return;
    }

    // Проверяем, является ли T циклическим сдвигом S
    if (isCyclicShift(s, t)) {
        alert("Yes");
    } else {
        alert("No");
    }
}

// Запускаем программу
main();