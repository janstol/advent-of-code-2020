# frozen_string_literal: true

require 'test_helper'

module Day05
  class SolutionTest < Minitest::Test

    def setup
      @solution = Solution.new
    end

    def test_day05_part01_example01
      bp = BoardingPass.parse_from_string('FBFBBFFRLR')
      assert_equal 44, bp.seat_row
      assert_equal 5, bp.seat_column
      assert_equal 357, bp.seat_id
    end

    def test_day05_part01_example02
      bp = BoardingPass.parse_from_string('BFFFBBFRRR')
      assert_equal 70, bp.seat_row
      assert_equal 7, bp.seat_column
      assert_equal 567, bp.seat_id
    end

    def test_day05_part01_example03
      bp = BoardingPass.parse_from_string('FFFBBBFRRR')
      assert_equal 14, bp.seat_row
      assert_equal 7, bp.seat_column
      assert_equal 119, bp.seat_id
    end

    def test_day05_part01_example04
      bp = BoardingPass.parse_from_string('BBFFBBFRLL')
      assert_equal 102, bp.seat_row
      assert_equal 4, bp.seat_column
      assert_equal 820, bp.seat_id
    end

    def test_day05_part01_example
      @solution = Solution.new 'test/day05/input.txt'
      assert_equal 820, @solution.solve_part01
    end

    def test_day05_part01_solution
      assert_equal 806, @solution.solve_part01
    end

    def test_day05_part02_solution
      assert_equal 562, @solution.solve_part02
    end
  end
end
