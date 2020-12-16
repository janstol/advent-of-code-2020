# frozen_string_literal: true

require 'test_helper'

module Day16
  class SolutionTest < Minitest::Test

    def setup
      @solution = Solution.new
    end

    def test_day16_part01_example
      @solution = Solution.new 'test/day16/input.txt'
      assert_equal 71, @solution.solve_part01
    end

    def test_day16_part01_solution
      assert_equal 24110, @solution.solve_part01
    end

    def test_day16_part02_example
      @solution = Solution.new 'test/day16/input2.txt'
      ticket = TicketLoader.new(@solution.input_raw).my_ticket
      assert_equal 12, ticket['class']
      assert_equal 11, ticket['row']
      assert_equal 13, ticket['seat']
    end

    def test_day16_part02_solution
      assert_equal 6766503490793, @solution.solve_part02
    end
  end
end
