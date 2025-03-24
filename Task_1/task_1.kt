fun isCyclicShift(s: String, t: String): Boolean {
    if (s.length != t.length) { // ���������, ����� �� ����� �����
        return false
    }

    val doubledS = s + s // ������� ������ S+S

    return doubledS.contains(t) // ���������, ���������� �� T � S+S
}

fun main() {
    // ��������� ������ S � T � ����������
    println("Enter string S:")
    val s = readLine() ?: return println("Error reading string S.")

    println("������� ������ T:")
    val t = readLine() ?: return println("Error reading string T.")

    if (isCyclicShift(s, t)) { // ���������, �������� �� T ����������� ������� S
        println("Yes")
    } else {
        println("No")
    }
}

