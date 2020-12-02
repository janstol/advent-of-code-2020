# frozen_string_literal: true

require 'test_helper'

module Day02
  class SolutionTest < Minitest::Test

    def setup
      @solution = Solution.new
    end

    def test_day02_part01_example
      @solution = Solution.new 'test/day02/input.txt'
      assert_equal 2, @solution.solve_part01
    end

    def test_day02_part01_solution
      assert_equal 660, @solution.solve_part01
    end

    def test_day02_part02_example
      @solution = Solution.new 'test/day02/input.txt'
      assert_equal 1, @solution.solve_part02
    end

    def test_day02_part02_solution
      assert_equal 530, @solution.solve_part02
    end
  end
end
