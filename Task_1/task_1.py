def is_cyclic_shift(s: str, t: str) -> bool:
    # ���������, ����� �� ����� �����
    if len(s) != len(t):
        return False

    # ������� ������ S+S
    doubled_s = s + s

    # ���������, ���������� �� T � S+S
    return t in doubled_s


def main():
    # ��������� ������ S � T � ����������
    s = input("������� ������ S: ").strip()
    if not s:
        print("������ ��� ����� ������ S.")
        return

    t = input("������� ������ T: ").strip()
    if not t:
        print("������ ��� ����� ������ T.")
        return

    # ���������, �������� �� T ����������� ������� S
    if is_cyclic_shift(s, t):
        print("Yes")
    else:
        print("No")


# ��������� ���������
if __name__ == "__main__":
    main()