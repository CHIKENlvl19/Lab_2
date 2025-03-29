<?php

function findFinalDestination($routes) {
    $graph = [];
    $destinations = [];

    foreach ($routes as $route) {
        list($start, $end) = $route;
        $graph[$start] = $end;
        $destinations[$end] = true;
    }

    $starts = array_diff(array_column($routes, 0), array_keys($destinations));
    if (empty($starts)) return "���������� � �����������";

    $finalDestination = "";
    $maxLength = 0;

    foreach ($starts as $start) {
        $current = $start;
        $length = 1;

        while (isset($graph[$current])) {
            $current = $graph[$current];
            $length++;
        }

        if ($length > $maxLength) {
            $maxLength = $length;
            $finalDestination = $current;
        }
    }

    if ($maxLength == 1 && $finalDestination === $graph[$finalDestination] ?? null) {
        return "���������� � �����������";
    }

    return $finalDestination;
}

echo "������� ���� ��������� � ������� '��������� ����� �������� �����'.\n";
echo "��� ���������� ����� ������� ������ ������.\n";

$routes = [];
while (true) {
    echo "������� �������: ";
    $input = trim(fgets(STDIN));
    if ($input === "") break;

    $parts = explode(" ", $input);
    if (count($parts) == 2) {
        $routes[] = [$parts[0], $parts[1]];
    } else {
        echo "������������ ����. ���������� �����.\n";
    }
}

$result = findFinalDestination($routes);
echo "\n$result\n";
?>