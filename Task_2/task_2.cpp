#include <iostream>
#include <vector>
#include <unordered_map>
#include <unordered_set>

using namespace std;

string findFinalDestination(vector< pair<string, string> > routes) {
    // Создаем граф маршрутов
    unordered_map<string, string> graph;
    unordered_set<string> destinations;

    for (pair <string, string> route : routes) { // Копируем пары вместо использования ссылок
        string start = route.first;
        string end = route.second;
        graph[start] = end;
        destinations.insert(end);
    }

    // Находим все начальные пункты (те, которые не являются конечными)
    unordered_set<string> starts;
    for (pair<string, string> route : routes) { // Копируем пары вместо использования ссылок
        string start = route.first;
        if (destinations.find(start) == destinations.end()) {
            starts.insert(start);
        }
    }

    // Проверяем, что у нас есть хотя бы один начальный пункт
    if (starts.empty()) {
        return "обратитесь к специалисту";
    }

    // Находим самую длинную цепочку
    string finalDestination = "";
    int maxLength = 0;

    for (string start : starts) { // Копируем строки вместо использования ссылок
        string current = start;
        int length = 1;

        while (graph.find(current) != graph.end()) {
            current = graph[current];
            length++;
        }

        if (length > maxLength) {
            maxLength = length;
            finalDestination = current;
        }
    }

    // Обработка случая, когда цепочка состоит из одного пункта
    if (maxLength == 1 && finalDestination == graph[finalDestination]) {
        return "обратитесь к специалисту";
    }

    return finalDestination;
}


int main() {
    vector< pair<string, string> > routes;
    string start, end;

    cout << "Введите пары маршрутов в формате 'начальный пункт конечный пункт'." << endl;
    cout << "Для завершения ввода введите пустую строку." << endl;

    while(true){
        cout << "Введите марштрут: ";
        cin >> start;
        if(cin.eof()) break;

        cin >> end;
        if(cin.eof()) break;

        routes.push_back( {start, end} );
    }

    string result = findFinalDestination(routes);
    cout << endl << result << endl;

    return 0;
}