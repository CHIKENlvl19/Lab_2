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
        if (!starts.Any()) return "обратитесь к специалисту";

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
            return "обратитесь к специалисту";
        }

        return finalDestination;
    }

    static void Main()
    {
        var routes = new List<(string, string)>();
        Console.WriteLine("Введите пары маршрутов в формате 'начальный пункт конечный пункт'.");
        Console.WriteLine("Для завершения ввода введите пустую строку.");

        while (true)
        {
            Console.Write("Введите маршрут: ");
            var input = Console.ReadLine();
            if (string.IsNullOrEmpty(input)) break;

            var parts = input.Split(' ');
            if (parts.Length == 2)
            {
                routes.Add((parts[0], parts[1]));
            }
            else
            {
                Console.WriteLine("Некорректный ввод. Попробуйте снова.");
            }
        }

        var result = FindFinalDestination(routes);
        Console.WriteLine($"\n{result}");
    }
}