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
    if (empty($starts)) return "обратитесь к специалисту";

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
        return "обратитесь к специалисту";
    }

    return $finalDestination;
}

echo "Введите пары маршрутов в формате 'начальный пункт конечный пункт'.\n";
echo "Для завершения ввода введите пустую строку.\n";

$routes = [];
while (true) {
    echo "Введите маршрут: ";
    $input = trim(fgets(STDIN));
    if ($input === "") break;

    $parts = explode(" ", $input);
    if (count($parts) == 2) {
        $routes[] = [$parts[0], $parts[1]];
    } else {
        echo "Некорректный ввод. Попробуйте снова.\n";
    }
}

$result = findFinalDestination($routes);
echo "\n$result\n";
?>