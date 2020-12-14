# frozen_string_literal: true

require 'test_helper'

module Day14
  class SolutionTest < Minitest::Test

    def setup
      @solution = Solution.new
    end

    def test_day14_part01_example
      @solution = Solution.new 'test/day14/input.txt'
      assert_equal 165, @solution.solve_part01
    end

    def test_day14_part01_solution
      assert_equal 6631883285184, @solution.solve_part01
    end

    def test_day14_part02_example
      @solution = Solution.new 'test/day14/input2.txt'
      assert_equal 208, @solution.solve_part02
    end

    def test_day14_part02_solution
      assert_equal 3161838538691, @solution.solve_part02
    end
  end
end
