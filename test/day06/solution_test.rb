# frozen_string_literal: true

require 'test_helper'

module Day06
  class SolutionTest < Minitest::Test

    def setup
      @solution = Solution.new
    end

    def test_day06_part01_example
      @solution = Solution.new 'test/day06/input.txt'
      assert_equal 11, @solution.solve_part01
    end

    def test_day06_part01_solution
      assert_equal 6930, @solution.solve_part01
    end

    def test_day06_part02_example
      @solution = Solution.new 'test/day06/input.txt'
      assert_equal 6, @solution.solve_part02
    end

    def test_day06_part02_solution
      assert_equal 3585, @solution.solve_part02
    end
  end
end
