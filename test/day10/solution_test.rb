# frozen_string_literal: true

require 'test_helper'

module Day10
  class SolutionTest < Minitest::Test

    def setup
      @solution = Solution.new
    end

    def test_day10_part01_example
      @solution = Solution.new 'test/day10/input.txt'
      assert_equal 7 * 5, @solution.solve_part01
    end

    def test_day10_part01_example2
      @solution = Solution.new 'test/day10/input2.txt'
      assert_equal 22 * 10, @solution.solve_part01
    end

    def test_day10_part01_solution
      assert_equal 2812, @solution.solve_part01
    end

    def test_day10_part02_example
      skip 'TODO'
      @solution = Solution.new 'test/day10/input.txt'
      assert_equal 8, @solution.solve_part02
    end

    def test_day10_part02_example2
      skip 'TODO'
      @solution = Solution.new 'test/day10/input2.txt'
      assert_equal 19208, @solution.solve_part02
    end

    def test_day10_part02_solution
      skip 'TODO'
      assert_equal 0, @solution.solve_part02
    end
  end
end
