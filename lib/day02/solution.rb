# frozen_string_literal: true

require_relative '../solution'

module Day02
  class Solution < Solution

    def solve_part01
      input.select do |line|
        elements = line.split(/(\d*)(?:-)(\d*)(?:\s)(\w)(?::)(?:\s)/).reject { |c| c == '' || c.nil? }
        elements[3].count(elements[2]).between?(elements[0].to_i, elements[1].to_i)
      end.size
    end

    def solve_part02
      input.select do |line|
        elements = line.split(/(\d*)(?:-)(\d*)(?:\s)(\w)(?::)(?:\s)/).reject { |c| c == '' }
        pos1 = elements[0].to_i - 1
        pos2 = elements[1].to_i - 1
        (elements[3][pos1] == elements[2]) ^ (elements[3][pos2] == elements[2])
      end.size
    end
  end
end
