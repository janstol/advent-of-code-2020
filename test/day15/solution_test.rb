# frozen_string_literal: true

require 'test_helper'

module Day15
  class SolutionTest < Minitest::Test

    def setup
      @solution = Solution.new
    end

    def test_day15_part01_example
      @solution = Solution.new 'test/day15/input.txt'
      assert_equal 436, @solution.solve_part01
    end

    def test_day15_part01_example2
      @solution = Solution.new 'test/day15/input2.txt'
      assert_equal 1, @solution.solve_part01
    end

    def test_day15_part01_solution
      assert_equal 1428, @solution.solve_part01
    end

    def test_day15_part02_example
      @solution = Solution.new 'test/day15/input3.txt'
      assert_equal 175594, @solution.solve_part02
    end

    def test_day15_part02_solution
      assert_equal 3718541, @solution.solve_part02
    end
  end
end
