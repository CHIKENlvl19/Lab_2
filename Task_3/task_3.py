def is_number_increasing(number):
    if number // 10 < 1:
        return False
    digits = []

    while number > 0:
        digits.append(number % 10)
        number //= 10

    digits.reverse()
    for i in range(1, len(digits)):
        if digits[i] <= digits[i - 1]:
            return False

    return True


def reverse_number(number):
    digits = []
    while number > 0:
        digits.append(number % 10)
        number //= 10

    reversed_number = 0
    for digit in digits:
        reversed_number = reversed_number * 10 + digit
    return reversed_number


def main():
    print("¬ведите числа, которые хотите проверить через пробел (Ctrl+D дл€ окончани€):")
    try:
        # —читываем все строки ввода до EOF (Ctrl+D)
        numbers = list(map(int, input().split()))
    except EOFError:
        numbers = []

    print()
    count_success = 0
    for n in numbers:
        if is_number_increasing(n):
            print(reverse_number(n), end=" ")
            count_success += 1

    if count_success == 0:
        print("»скомых чисел не найдено!")


if __name__ == "__main__":
    main()