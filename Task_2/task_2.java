import java.util.*;

public class Main {
    public static String findFinalDestination(List<String[]> routes) {
        Map<String, String> graph = new HashMap<>();
        Set<String> destinations = new HashSet<>();

        for (String[] route : routes) {
            String start = route[0];
            String end = route[1];
            graph.put(start, end);
            destinations.add(end);
        }

        Set<String> starts = new HashSet<>();
        for (String[] route : routes) {
            String start = route[0];
            if (!destinations.contains(start)) {
                starts.add(start);
            }
        }

        if (starts.isEmpty()) return "���������� � �����������";

        String finalDestination = "";
        int maxLength = 0;

        for (String start : starts) {
            String current = start;
            int length = 1;

            while (graph.containsKey(current)) {
                current = graph.get(current);
                length++;
            }

            if (length > maxLength) {
                maxLength = length;
                finalDestination = current;
            }
        }

        if (maxLength == 1 && finalDestination.equals(graph.get(finalDestination))) {
            return "���������� � �����������";
        }

        return finalDestination;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        List<String[]> routes = new ArrayList<>();

        System.out.println("������� ���� ��������� � ������� '��������� ����� �������� �����'.");
        System.out.println("��� ���������� ����� ������� ������ ������.");

        while (true) {
            System.out.print("������� �������: ");
            String input = scanner.nextLine().trim();
            if (input.isEmpty()) break;

            String[] parts = input.split(" ");
            if (parts.length == 2) {
                routes.add(parts);
            } else {
                System.out.println("������������ ����. ���������� �����.");
            }
        }

        String result = findFinalDestination(routes);
        System.out.println("\n" + result);
    }
}