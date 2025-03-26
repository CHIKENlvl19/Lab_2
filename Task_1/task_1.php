<?php

function isCyclicShift($s, $t) {
    // Проверяем, равны ли длины строк
    if (strlen($s) !== strlen($t)) {
        return false;
    }

    // Создаем строку S+S
    $doubledS = $s . $s;

    // Проверяем, содержится ли T в S+S
    return strpos($doubledS, $t) !== false;
}

// Считываем строки S и T с клавиатуры
echo "Введите строку S:\n";
$s = trim(fgets(STDIN));
if ($s === false || $s === '') {
    echo "Ошибка при вводе строки S.\n";
    exit;
}

echo "Введите строку T:\n";
$t = trim(fgets(STDIN));
if ($t === false || $t === '') {
    echo "Ошибка при вводе строки T.\n";
    exit;
}

// Проверяем, является ли T циклическим сдвигом S
if (isCyclicShift($s, $t)) {
    echo "Yes\n";
} else {
    echo "No\n";
}
