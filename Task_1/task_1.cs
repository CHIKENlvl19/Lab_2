using System;

class Program
{
    static bool IsCyclicShift(string s, string t)
    {
        // ���������, ����� �� ����� �����
        if (s.Length != t.Length)
        {
            return false;
        }

        // ������� ������ S+S
        string doubledS = s + s;

        // ���������, ���������� �� T � S+S
        return doubledS.Contains(t);
    }

    static void Main()
    {
        // ��������� ������ S � T � ����������
        Console.WriteLine("������� ������ S:");
        string s = Console.ReadLine();
        if (string.IsNullOrEmpty(s))
        {
            Console.WriteLine("������ ��� ����� ������ S.");
            return;
        }

        Console.WriteLine("������� ������ T:");
        string t = Console.ReadLine();
        if (string.IsNullOrEmpty(t))
        {
            Console.WriteLine("������ ��� ����� ������ T.");
            return;
        }

        // ���������, �������� �� T ����������� ������� S
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
