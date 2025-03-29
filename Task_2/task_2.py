def find_final_destination(routes):
    graph = {}
    destinations = set()

    for start, end in routes:
        graph[start] = end
        destinations.add(end)

    starts = set(route[0] for route in routes) - destinations
    if not starts:
        return "обратитесь к специалисту"

    final_destination = ""
    max_length = 0

    for start in starts:
        current = start
        length = 1

        while current in graph:
            current = graph[current]
            length += 1

        if length > max_length:
            max_length = length
            final_destination = current

    if max_length == 1 and final_destination == graph.get(final_destination):
        return "обратитесь к специалисту"

    return final_destination


print("Введите пары маршрутов в формате 'начальный пункт конечный пункт'.")
print("Для завершения ввода введите пустую строку.")

routes = []
while True:
    user_input = input("Введите маршрут: ").strip()
    if not user_input:
        break

    parts = user_input.split()
    if len(parts) == 2:
        routes.append(tuple(parts))
    else:
        print("Некорректный ввод. Попробуйте снова.")

result = find_final_destination(routes)
print(f"\n{result}")