# frozen_string_literal: true

require 'test_helper'

module Day01
  class SolutionTest < Minitest::Test

    def setup
      @solution = Solution.new
    end

    def test_day01_part01_example
      @solution = Solution.new 'test/day01/input.txt'
      assert_equal 514579, @solution.solve_part01
    end

    def test_day01_part01_solution
      assert_equal 996075, @solution.solve_part01
    end

    def test_day01_part02_example
      @solution = Solution.new 'test/day01/input.txt'
      assert_equal 241861950, @solution.solve_part02
    end

    def test_day01_part02_solution
      assert_equal 51810360, @solution.solve_part02
    end
  end
end
