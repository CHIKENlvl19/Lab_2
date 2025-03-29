fun findFinalDestination(routes: List<Pair<String, String>>): String {
    val graph = mutableMapOf<String, String>()
    val destinations = mutableSetOf<String>()

    for ((start, end) in routes) {
        graph[start] = end
        destinations.add(end)
    }

    val starts = routes.map { it.first }.toSet() - destinations
    if (starts.isEmpty()) return "обратитесь к специалисту"

    var finalDestination = ""
    var maxLength = 0

    for (start in starts) {
        var current = start
        var length = 1

        while (graph.containsKey(current)) {
            current = graph[current]!!
            length++
        }

        if (length > maxLength) {
            maxLength = length
            finalDestination = current
        }
    }

    if (maxLength == 1 && finalDestination == graph[finalDestination]) {
        return "обратитесь к специалисту"
    }

    return finalDestination
}

fun main() {
    val routes = mutableListOf<Pair<String, String>>()
    println("Введите пары маршрутов в формате 'начальный пункт конечный пункт'.")
    println("Для завершения ввода введите пустую строку.")

    while (true) {
        print("Введите маршрут: ")
        val input = readLine() ?: break
        if (input.isEmpty()) break

        val parts = input.split(" ")
        if (parts.size == 2) {
            routes.add(Pair(parts[0], parts[1]))
        } else {
            println("Некорректный ввод. Попробуйте снова.")
        }
    }

    val result = findFinalDestination(routes)
    println("\n$result")
}