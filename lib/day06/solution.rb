# frozen_string_literal: true

require_relative '../solution'

module Day06
  class Solution < Solution

    def solve_part01
      input_raw.split(/\n\n/).map { |g| PassengerGroup.new_from(g).yes_answers.size }.sum
    end

    def solve_part02
      input_raw.split(/\n\n/).map do |g|
        pg = PassengerGroup.new_from(g.delete_suffix("\n"))
        pg.yes_answers.select { |_, v| v >= pg.passenger_count }.size
      end.sum
    end
  end

  class PassengerGroup
    attr_reader :passenger_count, :yes_answers

    def initialize(passenger_count, yes_answers)
      @passenger_count = passenger_count
      @yes_answers = yes_answers
    end

    def self.new_from(str)
      passenger_count = 1
      yes_answers = {}

      str.each_char do |char|
        next passenger_count += 1 if char == "\n"
        yes_answers.merge!(char => 1) { |_, old_val, new_val| old_val + new_val }
      end

      new(passenger_count, yes_answers)
    end
  end
end
