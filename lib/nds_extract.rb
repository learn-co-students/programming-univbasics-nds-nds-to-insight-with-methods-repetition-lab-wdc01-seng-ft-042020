$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'
require 'pry'
def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
  
    result[director[:name]] = gross_for_director(director)
    director_index += 1

  end
  result

end
 
def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  new_array = []
  director_index = 0 
  while director_index < source.length do 
  director = source[director_index][:name]
  
  puts new_array << director
 director_index += 1 
 end 
 new_array
end

#h.each {|key, value| puts "#{key} is #{value}" }

def total_gross(source)
  listof_directors = list_of_directors(source)
  big_total = 0 
  row_index = 0 
  while row_index < source.length do
    directors_name = listof_directors[row_index]
     
    big_total += directors_totals(source)[directors_name]
    row_index += 1 
 end 
 
big_total 
end

# Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total

