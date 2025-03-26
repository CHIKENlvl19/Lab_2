using System;

class Program
{
    static bool IsCyclicShift(string s, string t)
    {
        // Проверяем, равны ли длины строк
        if (s.Length != t.Length)
        {
            return false;
        }

        // Создаем строку S+S
        string doubledS = s + s;

        // Проверяем, содержится ли T в S+S
        return doubledS.Contains(t);
    }

    static void Main()
    {
        // Считываем строки S и T с клавиатуры
        Console.WriteLine("Введите строку S:");
        string s = Console.ReadLine();
        if (string.IsNullOrEmpty(s))
        {
            Console.WriteLine("Ошибка при вводе строки S.");
            return;
        }

        Console.WriteLine("Введите строку T:");
        string t = Console.ReadLine();
        if (string.IsNullOrEmpty(t))
        {
            Console.WriteLine("Ошибка при вводе строки T.");
            return;
        }

        // Проверяем, является ли T циклическим сдвигом S
        if (IsCyclicShift(s, t))
        {
            Console.WriteLine("Yes");
        }
        else
        {
            Console.WriteLine("No");
        }
    }
}
