def find_final_destination(routes)
    graph = {}
    destinations = Set.new
  
    routes.each do |start, end_point|
      graph[start] = end_point
      destinations.add(end_point)
    end
  
    starts = routes.map(&:first).to_set - destinations
    return "обратитесь к специалисту" if starts.empty?
  
    final_destination = ""
    max_length = 0
  
    starts.each do |start|
      current = start
      length = 1
  
      while graph.key?(current)
        current = graph[current]
        length += 1
      end
  
      if length > max_length
        max_length = length
        final_destination = current
      end
    end
  
    if max_length == 1 && final_destination == graph[final_destination]
      return "обратитесь к специалисту"
    end
  
    final_destination
  end
  
  puts "Введите пары маршрутов в формате 'начальный пункт конечный пункт'."
  puts "Для завершения ввода введите пустую строку."
  
  routes = []
  while true
    print "Введите маршрут: "
    input = gets.chomp
    break if input.empty?
  
    parts = input.split
    if parts.size == 2
      routes << [parts[0], parts[1]]
    else
      puts "Некорректный ввод. Попробуйте снова."
    end
  end
  
  result = find_final_destination(routes)
  puts "\n#{result}"