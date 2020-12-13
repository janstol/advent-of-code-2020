# frozen_string_literal: true

require 'test_helper'

module Day13
  class SolutionTest < Minitest::Test

    def setup
      @solution = Solution.new
    end

    def test_day13_part01_example
      @solution = Solution.new 'test/day13/input.txt'
      assert_equal 295, @solution.solve_part01
    end

    def test_day13_part01_solution
      assert_equal 2406, @solution.solve_part01
    end

    def test_day13_part02_example
      @solution = Solution.new 'test/day13/input.txt'
      assert_equal 1068781, @solution.solve_part02
    end

    def test_day13_part02_example02
      @solution = Solution.new 'test/day13/input2.txt'
      assert_equal 3417, @solution.solve_part02
    end

    def test_day13_part02_example03
      @solution = Solution.new 'test/day13/input3.txt'
      assert_equal 754018, @solution.solve_part02
    end

    def test_day13_part02_example04
      @solution = Solution.new 'test/day13/input4.txt'
      assert_equal 779210, @solution.solve_part02
    end

    def test_day13_part02_example05
      @solution = Solution.new 'test/day13/input5.txt'
      assert_equal 1261476, @solution.solve_part02
    end

    def test_day13_part02_example06
      @solution = Solution.new 'test/day13/input6.txt'
      assert_equal 1202161486, @solution.solve_part02
    end

    def test_day13_part02_solution
      assert_equal 225850756401039, @solution.solve_part02
    end
  end
end
