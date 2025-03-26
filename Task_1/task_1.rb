def is_cyclic_shift(s, t)
    # Проверяем, равны ли длины строк
    return false if s.length != t.length
  
    # Создаем строку S+S
    doubled_s = s + s
  
    # Проверяем, содержится ли T в S+S
    doubled_s.include?(t)
  end
  
  # Основная программа
  puts "Введите строку S:"
  s = gets.chomp
  if s.empty?
    puts "Ошибка при вводе строки S."
    exit
  end
  
  puts "Введите строку T:"
  t = gets.chomp
  if t.empty?
    puts "Ошибка при вводе строки T."
    exit
  end
  
  # Проверяем, является ли T циклическим сдвигом S
  if is_cyclic_shift(s, t)
    puts "Yes"
  else
    puts "No"
  end