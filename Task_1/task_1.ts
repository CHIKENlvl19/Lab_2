function isCyclicShift(s: string, t: string): boolean {
    // ���������, ����� �� ����� �����
    if (s.length !== t.length) {
        return false;
    }

    // ������� ������ S+S
    const doubledS = s + s;

    // ���������, ���������� �� T � S+S
    return doubledS.includes(t);
}

async function main() {
    // ��������� ������ S � T � ������� prompt
    const s = prompt("������� ������ S:");
    if (!s) {
        alert("������ ��� ����� ������ S.");
        return;
    }

    const t = prompt("������� ������ T:");
    if (!t) {
        alert("������ ��� ����� ������ T.");
        return;
    }

    // ���������, �������� �� T ����������� ������� S
    if (isCyclicShift(s, t)) {
        alert("Yes");
    } else {
        alert("No");
    }
}

// ��������� ���������
main();