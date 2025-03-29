import Foundation

func findFinalDestination(_ routes: [(String, String)]) -> String {
    var graph: [String: String] = [:]
    var destinations: Set<String> = []

    for (start, end) in routes {
        graph[start] = end
        destinations.insert(end)
    }

    let starts = Set(routes.map { $0.0 }).subtracting(destinations)
    if starts.isEmpty { return "���������� � �����������" }

    var finalDestination = ""
    var maxLength = 0

    for start in starts {
        var current = start
        var length = 1

        while let next = graph[current] {
            current = next
            length += 1
        }

        if length > maxLength {
            maxLength = length
            finalDestination = current
        }
    }

    if maxLength == 1, let loopCheck = graph[finalDestination], loopCheck == finalDestination {
        return "���������� � �����������"
    }

    return finalDestination
}

print("������� ���� ��������� � ������� '��������� ����� �������� �����'.")
print("��� ���������� ����� ������� ������ ������.")

var routes: [(String, String)] = []
while true {
    print("������� �������: ", terminator: "")
    if let input = readLine(), !input.isEmpty {
        let parts = input.split(separator: " ").map { String($0) }
        if parts.count == 2 {
            routes.append((parts[0], parts[1]))
        } else {
            print("������������ ����. ���������� �����.")
        }
    } else {
        break
    }
}

let result = findFinalDestination(routes)
print("\n\(result)")