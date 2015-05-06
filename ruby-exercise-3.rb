#The exercise is to make the last exercise answer clearer, shorter and simpler using methods
require 'pp'

def to_words s
  s.split /[\W]+/
end

def starts_with_vowel s
  #FIXME Errors on an empty string
  #w{a e i o u} is a quick way of writing ['a', 'e', 'i', 'o', 'u']
  %w{a e i o u}.include? s[0].downcase #Can you see why we use downcase here?
end

def odd_num_words s
  s if to_words(s).count % 2 == 1
end

snowy = File.read 'the-man-from-snowy-river.txt'

snowy_lines = snowy.lines
snowy_words = to_words snowy
#pp snowy_words

#Example
# puts "Here are the lines of Snowy that start with a vowel"
#
# snowy_lines.each do |line|
#   puts line if starts_with_vowel line
# end

puts
puts "Here are the lines of Snowy that have an odd number of words"
#hint: a % b is the remainder after you divide a by b (called "mod" or "modulus")
# for example 17 % 2 == 1
i = 1
snowy_lines.each do |line|
  odd_line = odd_num_words line
  puts odd_line
  # puts snowy_lines.index(odd_line)
  # puts i if to_words(line).count % 2 == 1
  # i += 1 if to_words(line).count % 2 == 1
  puts to_words(line).count if to_words(line).count % 2 == 1
end
# puts "…"

puts
puts "Here are all the rhyming pairs from the ends of the Snowy lines"
# puts snowy_lines
i = 0
while i < snowy_lines.count
  a = snowy_lines[i].split(/[\W]+/).last
  b = snowy_lines[i+1].split(/[\W]+/).last
  aa = snowy_lines[i+2].split(/[\W]+/).last
  bb = snowy_lines[i+3].split(/[\W]+/).last
  c = snowy_lines[i+4].split(/[\W]+/).last
  d = snowy_lines[i+5].split(/[\W]+/).last
  cc = snowy_lines[i+6].split(/[\W]+/).last
  dd = snowy_lines[i+7].split(/[\W]+/).last
  puts "#{a}: #{aa}"
  puts "#{b}: #{bb}"
  puts "#{c}: #{cc}"
  puts "#{d}: #{dd}"
  i += 9 # This is a short way of writing i = i + 1
end
