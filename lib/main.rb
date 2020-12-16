# frozen_string_literal: true

# require_relative 'day01/solution'
# require_relative 'day02/solution'
# require_relative 'day03/solution'
# require_relative 'day04/solution'
# require_relative 'day05/solution'
# require_relative 'day06/solution'
# require_relative 'day07/solution'
# require_relative 'day08/solution'
# require_relative 'day09/solution'
# require_relative 'day10/solution'
# require_relative 'day11/solution'
# require_relative 'day12/solution'
# require_relative 'day13/solution'
# require_relative 'day14/solution'
# require_relative 'day15/solution'
require_relative 'day16/solution'

(1..25).each do |i|
  day = i.to_s.rjust(2, '0')
  solution = Object.const_get("Day#{day}::Solution").new
  puts "=== Day #{day} solution ==="
  puts "-> Part01: #{solution.solve_part01}"
  puts "-> Part02: #{solution.solve_part02}\n\n"
rescue NameError
  # Skip
end
