# frozen_string_literal: true

class Solution

  attr_reader :input_path

  def initialize(input = 'input.txt')
    @input_path = File.join(
      File.dirname(File.dirname(File.absolute_path(__FILE__))),
      'lib', self.class.name.split('::').first.downcase, input
    )
  end

  def input
    @input ||= File.readlines(input_path).map(&:chomp)
  end

  def each_input(&block)
    File.foreach(input_path, &block)
  end

  def solve_part01
    raise NotImplementedError
  end

  def solve_part02
    raise NotImplementedError
  end
end
