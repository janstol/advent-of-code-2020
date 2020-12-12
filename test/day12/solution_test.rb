# frozen_string_literal: true

require 'test_helper'

module Day12
  class SolutionTest < Minitest::Test

    def setup
      @solution = Solution.new
    end

    def test_day12_part01_example
      @solution = Solution.new 'test/day12/input.txt'
      assert_equal 25, @solution.solve_part01
    end

    def test_day12_part01_solution
      assert_equal 439, @solution.solve_part01
    end

    def test_day12_part02_example
      @solution = Solution.new 'test/day12/input.txt'
      assert_equal 286, @solution.solve_part02
    end

    def test_day12_part02_example02
      @solution = Solution.new 'test/day12/input2.txt'
      assert_equal 10, @solution.solve_part02
    end

    def test_day12_part02_solution
      assert_equal 12385, @solution.solve_part02
    end
  end
end
