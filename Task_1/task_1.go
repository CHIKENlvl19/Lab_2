package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

func isCyclicShift(s, t string) bool {
    // ���������, ����� �� ����� �����
    if len(s) != len(t) {
        return false
    }

    // ������� ������ S+S
    doubledS := s + s

    // ���������, ���������� �� T � S+S
    return strings.Contains(doubledS, t)
}

func main() {
    // �������������� ������ ��� ������ ����� � ����������
    scanner := bufio.NewScanner(os.Stdin)

    // ��������� ������ S
    fmt.Println("������� ������ S:")
    scanner.Scan()
    s := scanner.Text()
    if s == "" {
        fmt.Println("������ ��� ����� ������ S.")
        return
    }

    // ��������� ������ T
    fmt.Println("������� ������ T:")
    scanner.Scan()
    t := scanner.Text()
    if t == "" {
        fmt.Println("������ ��� ����� ������ T.")
        return
    }

    // ���������, �������� �� T ����������� ������� S
    if isCyclicShift(s, t) {
        fmt.Println("Yes")
    } else {
        fmt.Println("No")
    }
}
