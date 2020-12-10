# frozen_string_literal: true

require_relative '../solution'

module Day09
  class Solution < Solution

    def solve_part01
      Xmas.first_invalid_number(25, input)
    end

    def solve_part02
      Xmas.find_encryption_weakness(25, input)
    end
  end

  class Xmas
    def self.first_invalid_number(preamble_size, input)
      input.map(&:to_i).each_with_index do |num, index|
        next if index + 1 <= preamble_size

        numbers = input[(index - preamble_size)..index]
        sums = numbers.map(&:to_i).combination(2).map { |a, b| a + b }
        return num unless sums.include?(num)
      end
    end

    def self.find_encryption_weakness(preamble_size, input)
      invalid_num = first_invalid_number(preamble_size, input)

      sum = 0
      numbers = []
      input.map(&:to_i).each_with_index do |_num, index|
        input[index..-1].map(&:to_i).each do |n|
          sum += n
          numbers.push(n)

          break if sum == invalid_num && numbers.size > 1
          if sum > invalid_num
            sum = 0
            numbers = []
            break
          end
        end
        break if sum == invalid_num && numbers.size > 1
      end

      numbers.min + numbers.max
    end
  end
end
