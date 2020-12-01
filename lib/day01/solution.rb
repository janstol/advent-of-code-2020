# frozen_string_literal: true

require_relative '../solution'

module Day01
  class Solution < Solution
    TARGET_SUM = 2020

    def solve_part01
      clean_input.combination(2).find { |numbers| numbers.reduce(&:+) == TARGET_SUM }.reduce(&:*)
    end

    def solve_part02
      clean_input.combination(3).find { |numbers| numbers.reduce(&:+) == TARGET_SUM }.reduce(&:*)
    end

    private

    def clean_input
      @clean_input ||= input.map(&:to_i).filter { |i| i < TARGET_SUM and !i.nil? }
    end
  end
end
