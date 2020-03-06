$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'
require 'pp'

source = directors_database

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
  directors = [] # array of director names

  director_index = 0
  while director_index < source.length do
    directors << source[director_index][:name]
    director_index += 1
  end
  directors
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
  total = 0
  list_of_directorsArray = list_of_directors(source)
  directors_hashTotal = directors_totals(source)

  director_index = 0
  while director_index < list_of_directorsArray.length do
    director_name = list_of_directorsArray[director_index]
    total += directors_hashTotal[director_name]
    
    director_index += 1
  end

  total
end


