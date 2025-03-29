using System;
using System.Collections.Generic;
using System.Linq;

class Program
{
    // ������� ��� ��������, ������� �� ����� �� ����, ������ �� �����������
    static bool IsIncreasingDigits(int number)
    {
        int prevDigit = 10; // ��������� �������� ������ ����� ����� (0-9)
        int digitCount = 0; // ������� ���� � �����

        while (number > 0)
        {
            int digit = number % 10;
            digitCount++;

            if (digitCount > 1 && digit >= prevDigit)
            {
                return false;
            }

            prevDigit = digit;
            number /= 10;
        }

        // ���� ����� ������� �� ����� �����, ���������� false
        return digitCount > 1;
    }

    // ������� ��� ���������� �����
    static int ReverseNumber(int number)
    {
        int reversed = 0;

        while (number > 0)
        {
            int digit = number % 10;
            reversed = reversed * 10 + digit;
            number /= 10;
        }

        return reversed;
    }

    static void Main()
    {
        Console.WriteLine("������� ������������������ ����� ����� ������:");

        // ������ ����� � �������������� � ������ �����
        string input = Console.ReadLine();
        var numbers = input
            .Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries)
            .Select(s =>
            {
                int result;
                return int.TryParse(s, out result) ? result : (int?)null;
            })
            .Where(n => n.HasValue)
            .Select(n => n.Value)
            .ToList();

        // ��������� �����
        List<int> result = new List<int>();

        foreach (var number in numbers)
        {
            if (IsIncreasingDigits(number))
            {
                result.Add(ReverseNumber(number));
            }
        }

        // ����� ����������
        if (result.Count == 0)
        {
            Console.WriteLine("������� ����� �� �������!");
        }
        else
        {
            Console.WriteLine($"���������: {string.Join(" ", result)}");
        }
    }
}