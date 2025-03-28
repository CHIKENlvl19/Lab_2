<?php

function isNumberIncreasing($number) {
    if ($number / 10 < 1) return false;
    $digits = [];

    while ($number > 0) {
        $digits[] = $number % 10;
        $number = intdiv($number, 10);
    }

    $digits = array_reverse($digits);
    for ($i = 1; $i < count($digits); $i++) {
        if ($digits[$i] <= $digits[$i - 1]) return false;
    }

    return true;
}

function reverseNumber($number) {
    $digits = [];
    while ($number > 0) {
        $digits[] = $number % 10;
        $number = intdiv($number, 10);
    }

    $reversedNumber = 0;
    foreach ($digits as $digit) {
        $reversedNumber = $reversedNumber * 10 + $digit;
    }
    return $reversedNumber;
}

echo "¬ведите числа, которые хотите проверить через пробел (Ctrl+D дл€ окончани€):\n";
$numbers = [];
while ($line = fgets(STDIN)) {
    $numbers = array_merge($numbers, array_map('intval', preg_split('/\s+/', trim($line))));
}

echo "\n";
$countSuccess = 0;
foreach ($numbers as $n) {
    if (isNumberIncreasing($n)) {
        echo reverseNumber($n) . " ";
        $countSuccess++;
    }
}

if ($countSuccess == 0) {
    echo "»скомых чисел не найдено!\n";
}
?>