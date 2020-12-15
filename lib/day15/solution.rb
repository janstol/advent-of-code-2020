# frozen_string_literal: true

require_relative '../solution'

module Day15
  class Solution < Solution

    def solve_part01
      solve_elves_game(2020)
    end

    def solve_part02
      solve_elves_game(30_000_000)
    end

    private

    def solve_elves_game(n)
      numbers = input.first.split(',').map(&:to_i)
      spoken_numbers = Hash.new { |h, k| h[k] = [] }
      numbers.each_with_index { |num, i| spoken_numbers[num] << i }
      index = numbers.size
      previous_number = numbers.last

      until index == n
        previous_number = if spoken_numbers[previous_number].size == 1
                            0
                          else
                            spoken_numbers[previous_number].last(2).reduce(&:-).abs
                          end
        spoken_numbers[previous_number] << index
        index += 1
      end

      previous_number
    end
  end
end
