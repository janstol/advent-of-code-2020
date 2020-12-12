# frozen_string_literal: true

require 'test_helper'

module Day11
  class SolutionTest < Minitest::Test

    def setup
      @solution = Solution.new
    end

    def test_day11_part01_example
      @solution = Solution.new 'test/day11/input.txt'
      assert_equal 37, @solution.solve_part01
    end

    def test_day11_part01_solution
      assert_equal 2418, @solution.solve_part01
    end

    def test_day11_part02_example
      @solution = Solution.new 'test/day11/input.txt'
      assert_equal 26, @solution.solve_part02
    end

    def test_day11_part02_solution
      assert_equal 2144, @solution.solve_part02
    end
  end
end
