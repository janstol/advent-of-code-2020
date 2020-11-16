# frozen_string_literal: true

require 'test_helper'

class SolutionTest < Minitest::Test
  INPUT_CONTENT = %w[1 2 3 4 5].freeze
  SIMPLE_INPUT_CONTENT = '123'

  def setup
    @input_simple_path = 'test/fixtures/test_simple_input.txt'
    @input_path = 'test/fixtures/test_input.txt'
    @solution = Solution.new(@input_path)
  end

  def test_input
    assert_equal @input_path, @solution.input_path
    assert_equal INPUT_CONTENT, @solution.input
  end

  def test_each_input_line
    assert_equal @input_path, @solution.input_path
    @solution.each_input_line do |line, i|
      assert_equal INPUT_CONTENT[i], line.strip
    end
  end

  def test_input_simple
    solution = Solution.new(@input_simple_path)
    assert_equal @input_simple_path, solution.input_path
    assert_equal 1, solution.input.size
    assert_equal SIMPLE_INPUT_CONTENT, solution.input.first
  end

  def test_each_input_line_simple
    solution = Solution.new(@input_simple_path)
    assert_equal @input_simple_path, solution.input_path
    solution.each_input_line do |line|
      assert_equal SIMPLE_INPUT_CONTENT, line.strip
    end
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

