#When doing this exercise, use methods when appropriate to keep things organized.
require 'Set'
require 'pp'
snowy = File.read 'the-man-from-snowy-river.txt'
clancy = File.read 'clancy-of-the-overflow.txt'
words = File.read '/usr/share/dict/words'
snowy_words = snowy.split /\W+/
clancy_words = clancy.split /\W+/

#A set is a data structure that can have things added and removed, and you can ask if things are in it. You can make one from an array
dictionary = Set.new File.read('/usr/share/dict/words').lines.map{|w| w.chomp}
Dictionary = Set.new dictionary.select { |w| w[0] > 'a' && w[0] < 'z' }
# puts Dictionary.class

def in_dictionary? w
  puts "indictionary? #{w.downcase}: #{Dictionary.include? w.downcase}"
  Dictionary.include? w.downcase
end

def name? w
  ! in_dictionary?(w)
end
total = []
snowy_words.each { |w| total.push w if name? w }
clancy_words.each { |w| total.push w if name? w }
snowy_names = snowy_words.select { |w| name? w }

#We can treat arrays as sets, and use + for union, - for difference
puts "Words in snowy but not clancy"
puts (snowy_words.map {|w| w.downcase} - clancy_words.map {|w| w.downcase}).uniq.join ', '

puts
puts "… and the reverse"
a_proc = Proc.new { |words| words.map { |word| word.downcase}}
puts (a_proc.call(clancy_words).uniq - a_proc.call(snowy_words).uniq).join ', '

#The above are great, but note that we get both 'There' and 'there' separately (and others). Fix that.

puts
puts "The longest word in snowy is"
puts
snow = snowy_words.sort_by { |word| word.length }
puts snow.last

# Here, find the words that are in Snowy but not in the dictionary
puts
puts "Names in Snowy are:"
puts
pp snowy_names.join ', '
# snowy_set = snowy_words.map { |word| word.downcase }.to_set
# Look up the documentation for Set to see how to test if a word is in it or not
# capital_snowy_array = snowy_words.select { |x| x[0] == x[0].capitalize }
# capital_clancy_array = clancy_words.select { |x| x[0] == x[0].capitalize }
# a = capital_snowy_array.map { |x| x.downcase } - dictionary.to_a
# b = capital_clancy_array.map { |x| x.downcase } - dictionary.to_a
# snowy_names = []
# a.each do |w|
#   snowy_names << w unless w =~ /(ed)/ || w == 'boys'
# end
# snowy_names.to_set.each { |x| puts x.capitalize }
puts
puts "Names in both Snowy and Clancy:"
pp total.uniq.join ", "
# puts
# clancy_names = []
# b.each do |w|
#   clancy_names << w unless w =~ /(ed)/ || w == 'boys'
# end
# clancy_set = clancy_names.to_set
# snowy_set = snowy_names.to_set
#
# same = []
#
# a.each do |name|
#   same << name.capitalize if b.include? name
# end
#
# puts same.map { |w| w.capitalize }.to_set.map { |w| puts w }
# delete_set = clancy_set - snowy_set
# puts clancy_set.to_a
# puts
# puts
# puts snowy_set.to_a
# final_set = clancy_set + snowy_set - delete_set
# final_set.each { |w| puts w }
#Change this so it uses an array rather than a set. Marvel at how much slower it is.
#You can time how long something takes to run in bash by doing time before the command.
#So time ruby ruby-exercise-5.rb will tell you how long that took to run
