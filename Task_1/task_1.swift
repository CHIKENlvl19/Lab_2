import Foundation

func isCyclicShift(_ s: String, _ t: String) -> Bool {
    // ���������, ����� �� ����� �����
    if s.count != t.count {
        return false
    }

    // ������� ������ S+S
    let doubledS = s + s

    // ���������, ���������� �� T � S+S
    return doubledS.contains(t)
}

// ������� ��� ������ ����� � ����������
func readLine(prompt: String) -> String? {
    print(prompt, terminator: "")
    return readLine()
}

func main() {
    // ��������� ������ S � T � ����������
    guard let s = readLine(prompt: "������� ������ S: "), !s.isEmpty else {
        print("������ ��� ����� ������ S.")
        return
    }

    guard let t = readLine(prompt: "������� ������ T: "), !t.isEmpty else {
        print("������ ��� ����� ������ T.")
        return
    }

    // ���������, �������� �� T ����������� ������� S
    if isCyclicShift(s, t) {
        print("Yes")
    } else {
        print("No")
    }
}

main()