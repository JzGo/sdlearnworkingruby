@favorite_books = {
  'Frank Herbert'   => ['Dune', 'Dune Messiah', 'Children of Dune', 'God Emperor of Dune'],
  'Isaac Asimov'    => ['Foundation', 'Foundation and Empire', 'Second Foundation'],
  'Mervyn Peake'    => ['Titus Groan', 'Gormenghast'],
  'William Goldman' => ['The Princess Bride']
}

def get_books author
  books = @favorite_books[author]
  if books == nil
    puts "No such author"
  else
    puts books.join ', '
  end
end

def count_books author
  books = @favorite_books[author]
  if books == nil
    puts "No such author"
  else
    puts books.length
  end
end

def find book
  result = nil
  @favorite_books.each do |author, books|
    if books.include? book
      result = author
    end
  end
  if result
    puts result
  else
    puts "No such book"
  end
end

def handle_command command, arg
  if command == 'get'
    get_books arg
  elsif command == 'count'
    count_books arg
  elsif command == 'find'
    find arg
  else
    puts "Command not recognized"
  end
end

loop do
  print "Enter a command (q to finish): "

  entered = gets.chomp

  exit if entered == 'q'

  parts = entered.split ' ', 2 #Split into two parts
  handle_command parts[0], parts[1]
end
