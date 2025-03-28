import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {
    public static boolean isNumberIncreasing(int number) {
        if (number / 10 < 1) return false;
        List<Integer> digits = new ArrayList<>();

        while (number > 0) {
            digits.add(number % 10);
            number /= 10;
        }

        for (int i = 0, j = digits.size() - 1; i < j; i++, j--) {
            int temp = digits.get(i);
            digits.set(i, digits.get(j));
            digits.set(j, temp);
        }

        for (int i = 1; i < digits.size(); i++) {
            if (digits.get(i) <= digits.get(i - 1)) return false;
        }

        return true;
    }

    public static int reverseNumber(int number) {
        List<Integer> digits = new ArrayList<>();
        while (number > 0) {
            digits.add(number % 10);
            number /= 10;
        }

        int reversedNumber = 0;
        for (int digit : digits) {
            reversedNumber = reversedNumber * 10 + digit;
        }
        return reversedNumber;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("¬ведите числа, которые хотите проверить через пробел (Ctrl+D дл€ окончани€):");
        List<Integer> numbers = new ArrayList<>();

        while (scanner.hasNext()) {
            if (scanner.hasNextInt()) {
                numbers.add(scanner.nextInt());
            } else {
                scanner.next();
            }
        }

        System.out.println();
        int countSuccess = 0;
        for (int n : numbers) {
            if (isNumberIncreasing(n)) {
                System.out.print(reverseNumber(n) + " ");
                countSuccess++;
            }
        }

        if (countSuccess == 0) {
            System.out.println("»скомых чисел не найдено!");
        }
    }
}