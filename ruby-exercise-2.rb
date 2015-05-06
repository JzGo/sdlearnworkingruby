snowy = File.read 'the-man-from-snowy-river.txt'

snowy_lines = snowy.lines

split_pattern = /[\W]+/
snowy_words = snowy.split split_pattern

#Example
puts "Here are the lines of Snowy that start with a vowel"

snowy_lines.each do |line|
  c = line[0].downcase
  puts '  ' + line if c == 'a' || c == 'e' || c == 'o' || c == 'u'
end

puts
puts "Here are the lines of Snowy that have an odd number of words"
#hint: a % b is the remainder after you divide a by b (called "mod" or "modulus")
# for example 17 % 2 == 1
puts "…"

puts
puts "Here is Snowy double-spaced"
puts "…"

puts
puts "Here are all the rhyming pairs from the ends of the Snowy lines"
i = 0
while i < snowy_lines.count
  #hints:
  # you can access snowy_lines[i], snowy_lines[i + 1] etc each time through the loop
  # split each line into words using split_pattern
  # get the last word from the words using .last
  # grab the last words four at a time and then print out the first and third,
  # then the second and fourth
  puts
  i += 9 # This is a short way of writing i = i + 1
end
