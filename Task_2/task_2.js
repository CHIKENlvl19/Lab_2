function findFinalDestination(routes) {
    const graph = {};
    const destinations = new Set();

    for (const [start, end] of routes) {
        graph[start] = end;
        destinations.add(end);
    }

    const starts = [...new Set(routes.map(([start]) => start))].filter(
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

console.log("Введите пары маршрутов в формате 'начальный пункт конечный пункт'.");
console.log("Для завершения ввода введите пустую строку.");

const routes = [];
const readline = require("readline").createInterface({
    input: process.stdin,
    output: process.stdout,
});

const askRoute = () => {
    readline.question("Введите маршрут: ", (input) => {
        if (!input.trim()) {
            readline.close();
            console.log(findFinalDestination(routes));
            return;
        }

        const parts = input.split(" ");
        if (parts.length === 2) {
            routes.push([parts[0], parts[1]]);
        } else {
            console.log("Некорректный ввод. Попробуйте снова.");
        }
        askRoute();
    });
};

askRoute();