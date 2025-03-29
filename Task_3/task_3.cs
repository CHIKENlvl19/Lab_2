using System;
using System.Collections.Generic;
using System.Linq;

class Program
{
    // Функция для проверки, состоит ли число из цифр, идущих по возрастанию
    static bool IsIncreasingDigits(int number)
    {
        int prevDigit = 10; // Начальное значение больше любой цифры (0-9)
        int digitCount = 0; // Счетчик цифр в числе

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

        // Если число состоит из одной цифры, возвращаем false
        return digitCount > 1;
    }

    // Функция для переворота числа
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
        Console.WriteLine("Введите последовательность чисел через пробел:");

        // Чтение ввода и преобразование в массив чисел
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

        // Обработка чисел
        List<int> result = new List<int>();

        foreach (var number in numbers)
        {
            if (IsIncreasingDigits(number))
            {
                result.Add(ReverseNumber(number));
            }
        }

        // Вывод результата
        if (result.Count == 0)
        {
            Console.WriteLine("Искомых чисел не найдено!");
        }
        else
        {
            Console.WriteLine($"Результат: {string.Join(" ", result)}");
        }
    }
}