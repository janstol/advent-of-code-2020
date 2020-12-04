# frozen_string_literal: true

require_relative '../solution'

module Day03
  class Solution < Solution
    TREE = '#'.freeze

    def solve_part01
      count_trees([[3, 1]]).first
    end

    def solve_part02
      count_trees([[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]).reduce(&:*)
    end

    private

    # @param [Array<Array<Integer>>] slopes [[right, down], [right, down]]
    # @return [Array<Integer>]
    def count_trees(slopes)
      line_count = input.size
      width = input.first.length

      slopes.map do |right, down|
        steps_down = 0
        steps_right = 0
        tree_count = 0

        input.cycle do |line|
          next steps_down += 1 if steps_down.zero?
          next steps_down += 1 unless steps_down % down == 0

          steps_right += right
          tree_count += 1 if line[steps_right % width] == TREE
          steps_down += 1
          break if steps_down >= line_count
        end

        tree_count
      end
    end
  end
end
