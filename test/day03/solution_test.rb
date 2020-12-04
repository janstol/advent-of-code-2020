# frozen_string_literal: true

require 'test_helper'

module Day03
  class SolutionTest < Minitest::Test

    def setup
      @solution = Solution.new
    end

    def test_day03_part01_example
      @solution = Solution.new 'test/day03/input.txt'
      assert_equal 7, @solution.solve_part01
    end

    def test_day03_part01_solution
      assert_equal 265, @solution.solve_part01
    end

    def test_day03_part02_example
      @solution = Solution.new 'test/day03/input.txt'
      assert_equal 336, @solution.solve_part02
    end

    def test_day03_part02_solution
      assert_equal 3154761400, @solution.solve_part02
    end
  end
end
