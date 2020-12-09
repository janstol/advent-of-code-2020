# frozen_string_literal: true

require_relative '../solution'

module Day09
  class Solution < Solution

    def solve_part01
      Xmas.first_invalid_number(25, input)
    end

    def solve_part02
      raise NotImplementedError
    end
  end

  class Xmas
    def self.first_invalid_number(preamble_size, input)
      input.map(&:to_i).each_with_index do |num, index|
        next if index + 1 <= preamble_size

        numbers = input[(index-preamble_size)..index]
        sums = numbers.map(&:to_i).combination(2).map { |a, b| a + b }
        return num unless sums.include?(num)
      end
    end
  end
end
