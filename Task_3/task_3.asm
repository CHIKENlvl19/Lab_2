BITS 64          ; Указание на 64-битную архитектуру
section .data
    endLine db 0x0a, 0   ; Символ перевода строки
    space db ' ', 0      ; Пробел для разделения вывода

section .text
    global _start

_start:
    ; Инициализация стека
    push rbp             ; Сохраняем предыдущий указатель стека
    mov rbp, rsp         ; Устанавливаем новый указатель стека
    sub rsp, 80          ; Выделяем память для локальных переменных
    push r12             ; Сохраняем регистры, которые будем использовать
    push rbx

    ; Чтение количества элементов (n)
    lea rsi, [rbp-32]   ; Загружаем адрес буфера для ввода
    mov rdx, 7           ; Максимальная длина ввода (7 символов)
    call _read           ; Вызываем функцию чтения

    ; Преобразование строки в число (n)
    lea rdi, [rbp-32]    ; Адрес введенной строки
    call _strlen         ; Получаем длину строки
    mov rsi, rax         ; Длина строки как аргумент
    call _str_to_int     ; Конвертируем строку в число
    mov qword [rbp-80], rax ; Сохраняем число n в стеке
    xor r10, r10         ; Счетчик элементов (i = 0)
    xor r12, r12         ; Счетчик подходящих чисел (для управления пробелами)

_loop:
    ; Основной цикл обработки чисел
    lea rsi, [rbp-64]    ; Буфер для текущего числа
    mov rdx, 31          ; Максимальная длина числа (31 символ)
    call _read           ; Читаем число с клавиатуры

    ; Обработка введенного числа
    lea rdi, [rbp-64]    ; Адрес текущего числа
    call _strlen_to_zero ; Получаем длину и заменяем \n на 0
    mov rbx, rax         ; Сохраняем длину числа

    ; Проверка на возрастание цифр
    lea rdi, [rbp-64]    ; Адрес числа
    mov rsi, rbx         ; Длина числа
    call _check_ascending; Проверяем условие возрастания
    test al, al          ; Проверяем результат (0 = не подходит)
    jz _skip_reverse     ; Пропускаем если не подходит

    ; Управление пробелами между числами
    test r12, r12        ; Проверяем, первое ли это число
    jz .no_space         ; Если первое - пробел не нужен
    mov rsi, space       ; Загружаем пробел
    mov rdx, 1           ; Длина вывода
    call _write          ; Выводим пробел
.no_space:
    inc r12              ; Увеличиваем счетчик подходящих чисел

    ; Переворот числа
    lea rdi, [rbp-64]    ; Исходное число
    mov rsi, rbx         ; Длина числа
    lea rdx, [rbp-32]    ; Буфер для перевернутого числа
    call _reverse_string ; Переворачиваем строку

    ; Вывод перевернутого числа
    lea rsi, [rbp-32]    ; Перевернутое число
    mov rdx, r9          ; Длина перевернутого числа
    call _write          ; Выводим результат

_skip_reverse:
    inc r10              ; Увеличиваем счетчик элементов
    cmp qword [rbp-80], r10 ; Сравниваем с n
    jne _loop            ; Повторяем цикл если не все элементы обработаны

    ; Завершающий перевод строки
    test r12, r12        ; Если были подходящие числа
    jz .no_end_line      ; Пропускаем если нечего выводить
    mov rsi, endLine     ; Загружаем символ перевода строки
    mov rdx, 1           ; Длина вывода
    call _write          ; Выводим перевод строки
.no_end_line:
    pop rbx              ; Восстанавливаем регистры
    pop r12
    leave                ; Восстанавливаем стек
    call _exit           ; Завершаем программу

; ========== ФУНКЦИИ ==========

_read:
    ; Системный вызов read
    mov rax, 0           ; Номер syscall (read)
    mov rdi, 0           ; Дескриптор (stdin)
    syscall
    ret

_write:
    ; Системный вызов write
    mov rax, 1           ; Номер syscall (write)
    mov rdi, 1           ; Дескриптор (stdout)
    syscall
    ret

_reverse_string:
    ; Переворачивает строку
    ; Вход: RDI - исходная строка, RSI - длина, RDX - буфер назначения
    mov rcx, rsi         ; Длина строки в счетчик
    xor rbx, rbx         ; Очищаем регистры
    xor r9, r9           ; Счетчик для перевернутой строки
_reverse_string_loop:
    dec rcx              ; Двигаемся с конца строки
    mov bl, byte [rdi+rcx] ; Берем символ
    mov [rdx+r9], bl     ; Записываем в буфер
    inc r9               ; Увеличиваем счетчик
    cmp rcx, 0           ; Проверяем конец строки
    jne _reverse_string_loop
    mov byte [rdx+r9], 0 ; Добавляем нуль-терминатор
    ret

_strlen:
    ; Длина строки до \n
    xor rax, rax         ; Счетчик длины
_strlen_loop:
    cmp byte [rdi + rax], 0x0a ; Ищем символ новой строки
    je .end              ; Если нашли - выходим
    inc rax              ; Увеличиваем счетчик
    jmp _strlen_loop
.end:
    ret

_strlen_to_zero:
    ; Длина строки до \n или 0, заменяет \n на 0
    xor rax, rax         ; Счетчик длины
_strlen_to_zero_loop:
    mov bl, byte [rdi + rax] ; Текущий символ
    cmp bl, 0x0a         ; Проверка на \n
    je .replace_newline  ; Заменяем на 0
    cmp bl, 0            ; Проверка на конец строки
    je .end              ; Если 0 - завершаем
    inc rax              ; Увеличиваем счетчик
    jmp _strlen_to_zero_loop
.replace_newline:
    mov byte [rdi + rax], 0 ; Заменяем \n на 0
.end:
    ret

_check_ascending:
    ; Проверка цифр на возрастание
    ; Возвращает 1 в AL если условие выполнено
    cmp rsi, 1           ; Числа длиной 1 не обрабатываем
    jle .fail
    mov rcx, 1           ; Индекс текущего символа
.check_loop:
    mov al, byte [rdi + rcx - 1] ; Предыдущий символ
    mov bl, byte [rdi + rcx]     ; Текущий символ
    cmp al, bl           ; Сравниваем символы
    jge .fail            ; Если не возрастают - выход
    inc rcx              ; Следующий символ
    cmp rcx, rsi         ; Проверяем конец строки
    jl .check_loop       ; Продолжаем цикл
    mov al, 1            ; Возвращаем успех
    ret
.fail:
    xor al, al           ; Возвращаем 0
    ret

_str_to_int:
    ; Конвертация строки в целое число
    push rbp 
    mov rbp, rsp
    sub rsp, 24          ; Выделяем место для локальных переменных
    mov qword [rbp-8], 0 ; Инициализация результата
    mov qword [rbp-16], rsi ; Сохраняем длину строки
    mov qword [rbp-24], rdi ; Сохраняем адрес строки
    xor rax, rax
    xor rdx, rdx
_str_to_int_loop:
    mov rdi, qword [rbp-24] ; Адрес строки
    mov cl, byte [rdi+rdx] ; Текущий символ
    sub cl, 0x30          ; Конвертация ASCII в число
    mov rsi, qword [rbp-16] ; Длина строки
    mov rdi, 10           ; Основание системы
    sub rsi, rdx          ; Позиция в числе
    dec rsi               ; Степень 10
    call _pow             ; Вычисляем 10^position
    imul rcx, rax         ; Умножаем цифру на степень
    add qword [rbp-8], rcx ; Суммируем
    inc rdx               ; Следующий символ
    cmp rdx, [rbp-16]     ; Проверяем конец строки
    jne _str_to_int_loop
    mov rax, [rbp - 8]    ; Возвращаем результат
    leave
    ret

_pow:
    ; Вычисление RDI^RSI
    mov rax, 1            ; Инициализация результата
    xor rbx, rbx          ; Счетчик степени
_pow_loop:
    cmp rbx, rsi          ; Проверяем достижение нужной степени
    je _pow_end
    imul rax, rdi         ; Умножаем на основание
    inc rbx               ; Увеличиваем счетчик
    jmp _pow_loop
_pow_end:
    ret

_exit:
    ; Завершение программы
    mov rax, 60           ; Системный вызов exit
    xor rdi, rdi          ; Код возврата 0
    syscall