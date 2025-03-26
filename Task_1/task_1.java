import java.util.Scanner;

public class CyclicShiftChecker {

    // ����� ��� ��������, �������� �� T ����������� ������� S
    public static boolean isCyclicShift(String s, String t) {
        // ���������, ����� �� ����� �����
        if (s.length() != t.length()) {
            return false;
        }

        // ������� ������ S+S
        String doubledS = s + s;

        // ���������, ���������� �� T � S+S
        return doubledS.contains(t);
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // ��������� ������ S � T � ����������
        System.out.println("������� ������ S:");
        String s = scanner.nextLine().trim();
        if (s.isEmpty()) {
            System.out.println("������ ��� ����� ������ S.");
            scanner.close();
            return;
        }

        System.out.println("������� ������ T:");
        String t = scanner.nextLine().trim();
        if (t.isEmpty()) {
            System.out.println("������ ��� ����� ������ T.");
            scanner.close();
            return;
        }

        // ���������, �������� �� T ����������� ������� S
        if (isCyclicShift(s, t)) {
            System.out.println("Yes");
        } else {
            System.out.println("No");
        }

        // ��������� �������
        scanner.close();
    }
}