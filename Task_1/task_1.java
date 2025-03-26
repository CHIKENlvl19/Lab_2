import java.util.Scanner;

public class CyclicShiftChecker {

    // Метод для проверки, является ли T циклическим сдвигом S
    public static boolean isCyclicShift(String s, String t) {
        // Проверяем, равны ли длины строк
        if (s.length() != t.length()) {
            return false;
        }

        // Создаем строку S+S
        String doubledS = s + s;

        // Проверяем, содержится ли T в S+S
        return doubledS.contains(t);
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Считываем строки S и T с клавиатуры
        System.out.println("Введите строку S:");
        String s = scanner.nextLine().trim();
        if (s.isEmpty()) {
            System.out.println("Ошибка при вводе строки S.");
            scanner.close();
            return;
        }

        System.out.println("Введите строку T:");
        String t = scanner.nextLine().trim();
        if (t.isEmpty()) {
            System.out.println("Ошибка при вводе строки T.");
            scanner.close();
            return;
        }

        // Проверяем, является ли T циклическим сдвигом S
        if (isCyclicShift(s, t)) {
            System.out.println("Yes");
        } else {
            System.out.println("No");
        }

        // Закрываем сканнер
        scanner.close();
    }
}