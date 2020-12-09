# frozen_string_literal: true

require 'test_helper'

module Day08
  class SolutionTest < Minitest::Test

    def setup
      @solution = Solution.new
    end

    def test_day08_part01_example
      @solution = Solution.new 'test/day08/input.txt'
      assert_equal 5, @solution.solve_part01
    end

    def test_day08_part01_solution
      assert_equal 1331, @solution.solve_part01
    end

    def test_day08_part02_example
      @solution = Solution.new 'test/day08/input.txt'
      assert_equal 8, @solution.solve_part02
    end

    def test_day08_part02_solution
      assert_equal 1121, @solution.solve_part02
    end
  end
end
