function findFinalDestination(routes: [string, string][]): string {
    const graph: { [key: string]: string } = {};
    const destinations: Set<string> = new Set();

    for (const [start, end] of routes) {
        graph[start] = end;
        destinations.add(end);
    }

    const starts = Array.from(new Set(routes.map(([start]) => start))).filter(
        (start) => !destinations.has(start)
    );
    if (starts.length === 0) return "обратитесь к специалисту";

    let finalDestination = "";
    let maxLength = 0;

    for (const start of starts) {
        let current = start;
        let length = 1;

        while (graph[current]) {
            current = graph[current];
            length++;
        }

        if (length > maxLength) {
            maxLength = length;
            finalDestination = current;
        }
    }

    if (maxLength === 1 && finalDestination === graph[finalDestination]) {
        return "обратитесь к специалисту";
    }

    return finalDestination;
}

// Ввод данных через prompt
console.log("Введите пары маршрутов в формате 'начальный пункт конечный пункт'.");
console.log("Для завершения ввода введите пустую строку.");

const routes: [string, string][] = [];
while (true) {
    const input = prompt("Введите маршрут (или оставьте пустым для завершения):");
    if (!input?.trim()) break;

    const parts = input.split(" ");
    if (parts.length === 2) {
        routes.push([parts[0], parts[1]]);
    } else {
        console.log("Некорректный ввод. Попробуйте снова.");
    }
}

const result = findFinalDestination(routes);
console.log(`\nИтоговый результат: ${result}`);