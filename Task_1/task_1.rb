def is_cyclic_shift(s, t)
    # ���������, ����� �� ����� �����
    return false if s.length != t.length
  
    # ������� ������ S+S
    doubled_s = s + s
  
    # ���������, ���������� �� T � S+S
    doubled_s.include?(t)
  end
  
  # �������� ���������
  puts "������� ������ S:"
  s = gets.chomp
  if s.empty?
    puts "������ ��� ����� ������ S."
    exit
  end
  
  puts "������� ������ T:"
  t = gets.chomp
  if t.empty?
    puts "������ ��� ����� ������ T."
    exit
  end
  
  # ���������, �������� �� T ����������� ������� S
  if is_cyclic_shift(s, t)
    puts "Yes"
  else
    puts "No"
  end