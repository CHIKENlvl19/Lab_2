using System;
using System.Collections.Generic;
using System.Linq;

class Program
{
    static string FindFinalDestination(List<(string, string)> routes)
    {
        var graph = new Dictionary<string, string>();
        var destinations = new HashSet<string>();

        foreach (var (start, end) in routes)
        {
            graph[start] = end;
            destinations.Add(end);
        }

        var starts = routes.Select(r => r.Item1).ToHashSet().Except(destinations);
        if (!starts.Any()) return "���������� � �����������";

        string finalDestination = "";
        int maxLength = 0;

        foreach (var start in starts)
        {
            var current = start;
            int length = 1;

            while (graph.ContainsKey(current))
            {
                current = graph[current];
                length++;
            }

            if (length > maxLength)
            {
                maxLength = length;
                finalDestination = current;
            }
        }

        if (maxLength == 1 && finalDestination == graph.GetValueOrDefault(finalDestination))
        {
            return "���������� � �����������";
        }

        return finalDestination;
    }

    static void Main()
    {
        var routes = new List<(string, string)>();
        Console.WriteLine("������� ���� ��������� � ������� '��������� ����� �������� �����'.");
        Console.WriteLine("��� ���������� ����� ������� ������ ������.");

        while (true)
        {
            Console.Write("������� �������: ");
            var input = Console.ReadLine();
            if (string.IsNullOrEmpty(input)) break;

            var parts = input.Split(' ');
            if (parts.Length == 2)
            {
                routes.Add((parts[0], parts[1]));
            }
            else
            {
                Console.WriteLine("������������ ����. ���������� �����.");
            }
        }

        var result = FindFinalDestination(routes);
        Console.WriteLine($"\n{result}");
    }
}