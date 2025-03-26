def is_cyclic_shift(s: str, t: str) -> bool:
    # Проверяем, равны ли длины строк
    if len(s) != len(t):
        return False

    # Создаем строку S+S
    doubled_s = s + s

    # Проверяем, содержится ли T в S+S
    return t in doubled_s


def main():
    # Считываем строки S и T с клавиатуры
    s = input("Введите строку S: ").strip()
    if not s:
        print("Ошибка при вводе строки S.")
        return

    t = input("Введите строку T: ").strip()
    if not t:
        print("Ошибка при вводе строки T.")
        return

    # Проверяем, является ли T циклическим сдвигом S
    if is_cyclic_shift(s, t):
        print("Yes")
    else:
        print("No")


# Запускаем программу
if __name__ == "__main__":
    main()