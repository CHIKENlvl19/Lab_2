fun isCyclicShift(s: String, t: String): Boolean {
    if (s.length != t.length) { // Проверяем, равны ли длины строк
        return false
    }

    val doubledS = s + s // Создаем строку S+S

    return doubledS.contains(t) // Проверяем, содержится ли T в S+S
}

fun main() {
    // Считываем строки S и T с клавиатуры
    println("Enter string S:")
    val s = readLine() ?: return println("Error reading string S.")

    println("Введите строку T:")
    val t = readLine() ?: return println("Error reading string T.")

    if (isCyclicShift(s, t)) { // Проверяем, является ли T циклическим сдвигом S
        println("Yes")
    } else {
        println("No")
    }
}

