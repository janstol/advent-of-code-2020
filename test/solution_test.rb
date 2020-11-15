# frozen_string_literal: true

require 'test_helper'

class SolutionTest < Minitest::Test

  def setup
    @solution = Solution.new
  end

  def test_day01_part01_not_implemented_error
    assert_raises NotImplementedError do
      @solution.solve_part01
    end
  end

  def test_day01_part02_not_implemented_error
    assert_raises NotImplementedError do
      @solution.solve_part02
    end
  end
end

