# frozen_string_literal: true

class Solution

  attr_reader :input_path, :input_raw

  def initialize(input_path = nil)
    default_path = File.join(
      File.dirname(File.dirname(File.absolute_path(__FILE__))),
      'lib', self.class.name.split('::').first.downcase, 'input.txt'
    )
    @input_path = input_path || default_path
  end

  def input
    @input ||= File.readlines(input_path).map(&:chomp).reject { |c| c == '' }
  end

  def input_raw
    @input_raw ||= File.read(input_path)
  end

  def each_input_line
    index = 0
    File.foreach(input_path) do |line|
      yield(line, index)
      index += 1
    end
  end

  def solve_part01
    raise NotImplementedError
  end

  def solve_part02
    raise NotImplementedError
  end
end
