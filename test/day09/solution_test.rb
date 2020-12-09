# frozen_string_literal: true

require 'test_helper'

module Day09
  class SolutionTest < Minitest::Test

    def setup
      @solution = Solution.new
    end

    def test_day09_part01_example
      input = File.readlines('test/day09/input.txt').map(&:chomp).reject { |c| c == '' }
      assert_equal 127, Xmas.first_invalid_number(5, input)
    end

    def test_day09_part01_solution
      assert_equal 257342611, @solution.solve_part01
    end

    def test_day09_part02_solution
      assert_raises NotImplementedError do
        @solution.solve_part02
      end
    end
  end
end
