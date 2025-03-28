def is_number_increasing(number)
    return false if number / 10 < 1
    digits = []
  
    while number > 0
      digits << number % 10
      number /= 10
    end
  
    digits.reverse!
    (1...digits.size).each do |i|
      return false if digits[i] <= digits[i - 1]
    end
  
    true
  end
  
  def reverse_number(number)
    digits = []
    while number > 0
      digits << number % 10
      number /= 10
    end
  
    reversed_number = 0
    digits.each do |digit|
      reversed_number = reversed_number * 10 + digit
    end
    reversed_number
  end
  
  puts "¬ведите числа, которые хотите проверить через пробел (Ctrl+D дл€ окончани€):"
  numbers = []
  while line = gets
    numbers += line.split.map(&:to_i)
  end
  
  puts
  count_success = 0
  numbers.each do |n|
    if is_number_increasing(n)
      print "#{reverse_number(n)} "
      count_success += 1
    end
  end
  
  if count_success == 0
    puts "»скомых чисел не найдено!"
  end