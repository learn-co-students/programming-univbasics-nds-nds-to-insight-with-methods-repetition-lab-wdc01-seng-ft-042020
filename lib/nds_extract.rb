$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

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
  # Write this implementation
  
  directors_names = []
  i = 0 
  
  while (i < source.length) do
    directors_names.push(source[i][:name])
    i += 1
  end
  
  return directors_names

end

def total_gross(source)
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
  pp source
  
  total = 0 
  
  directors_hash = directors_totals(source)
  directors_list = list_of_directors(source);
  
  i = 0 
  
  while (i < directors_list.length) do
    
    total += directors_hash[directors_list[i]]
    i += 1
    
  end
  
  return total
  
end


