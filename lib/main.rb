# frozen_string_literal: true

# require_relative 'day1/solution'

(1..25).each do |i|
  solution = Object.const_get("Day#{i}::Solution").new
  puts "=== Day #{i.to_s.rjust(2, '0')} solution ==="
  puts "-> Part01: #{solution.solve_part01}"
  puts "-> Part02: #{solution.solve_part02}\n\n"
rescue NameError
  # Skip
end
