<?php

function isCyclicShift($s, $t) {
    // ���������, ����� �� ����� �����
    if (strlen($s) !== strlen($t)) {
        return false;
    }

    // ������� ������ S+S
    $doubledS = $s . $s;

    // ���������, ���������� �� T � S+S
    return strpos($doubledS, $t) !== false;
}

// ��������� ������ S � T � ����������
echo "������� ������ S:\n";
$s = trim(fgets(STDIN));
if ($s === false || $s === '') {
    echo "������ ��� ����� ������ S.\n";
    exit;
}

echo "������� ������ T:\n";
$t = trim(fgets(STDIN));
if ($t === false || $t === '') {
    echo "������ ��� ����� ������ T.\n";
    exit;
}

// ���������, �������� �� T ����������� ������� S
if (isCyclicShift($s, $t)) {
    echo "Yes\n";
} else {
    echo "No\n";
}
