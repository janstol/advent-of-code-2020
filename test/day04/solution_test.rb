# frozen_string_literal: true

require 'test_helper'

module Day04
  class SolutionTest < Minitest::Test

    def setup
      @solution = Solution.new
    end

    def test_day04_part01_example
      @solution = Solution.new 'test/day04/input.txt'
      assert_equal 2, @solution.solve_part01
    end

    def test_day04_part01_solution
      assert_equal 239, @solution.solve_part01
    end

    def test_day04_part02_example_valid
      @solution = Solution.new 'test/day04/valid_passports.txt'
      assert_equal 4, @solution.solve_part02
    end

    def test_day04_part02_example_invalid
      @solution = Solution.new 'test/day04/invalid_passports.txt'
      assert_equal 0, @solution.solve_part02
    end

    def test_day04_part02_solution
      assert_equal 188, @solution.solve_part02
    end
  end
end
