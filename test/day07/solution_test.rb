# frozen_string_literal: true

require 'test_helper'

module Day07
  class SolutionTest < Minitest::Test

    def setup
      @solution = Solution.new
    end

    def test_day07_part01_example
      @solution = Solution.new 'test/day07/input.txt'
      assert_equal 4, @solution.solve_part01
    end

    def test_day07_part01_solution
      assert_equal 151, @solution.solve_part01
    end

    def test_day07_part02_example
      @solution = Solution.new 'test/day07/input.txt'
      assert_equal 32, @solution.solve_part02
    end

    def test_day07_part02_example02
      @solution = Solution.new 'test/day07/input2.txt'
      assert_equal 126, @solution.solve_part02
    end

    def test_day07_part02_solution
      assert_equal 41559, @solution.solve_part02
    end
  end
end
