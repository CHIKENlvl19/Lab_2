function isCyclicShift(s, t) {
    // ���������, ����� �� ����� �����
    if (s.length !== t.length) {
        return false;
    }

    // ������� ������ S+S
    const doubledS = s + s;

    // ���������, ���������� �� T � S+S
    return doubledS.includes(t);
}

// ������� ��� ������ ����� � ����������
function readLine(prompt) {
    return prompt ? prompt.trim() : null;
}

function main() {
    // ��������� ������ S � T � ������� prompt
    const s = readLine(prompt("������� ������ S:"));
    if (!s) {
        console.log("������ ��� ����� ������ S.");
        return;
    }

    const t = readLine(prompt("������� ������ T:"));
    if (!t) {
        console.log("������ ��� ����� ������ T.");
        return;
    }

    // ���������, �������� �� T ����������� ������� S
    if (isCyclicShift(s, t)) {
        console.log("Yes");
    } else {
        console.log("No");
    }
}

// ��������� ���������
main();