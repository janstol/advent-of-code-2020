# frozen_string_literal: true

require_relative '../solution'

module Day07
  class Solution < Solution

    def solve_part01
      BagsParser.new(input).count_contains(:shiny_gold)
    end

    def solve_part02
      BagsParser.new(input).count_inside(:shiny_gold)
    end

  end

  class BagsParser
    def initialize(input)
      @input = input
      load_bags
    end

    # @param [Symbol] bag
    # @return [Integer]
    def count_contains(bag)
      @bags.select { |b| contains?(b, bag) }.count
    end

    # @param [Symbol] bag
    # @return [Integer]
    def count_inside(bag)
      count_all(bag) - 1
    end

    private

    def contains?(outer, inner)
      return true if @bags[outer].has_key?(inner)

      @bags[outer].map { |k, _| contains?(k, inner) }.any?
    end

    def count_all(bag)
      return 1 if @bags[bag].empty?

      children_count = 0
      @bags[bag].each { |k, v| children_count += (count_all(k) * v) }
      children_count + 1
    end

    def load_bags
      @bags = @input.each_with_object({}) do |line, bags|
        line = line.gsub(' bags', '').gsub(' bag', '').gsub('.', '').split(' contain ')
        bag_name = line[0].gsub(' ', '_')
        bags_children = line[1].split(', ')

        bags[bag_name.to_sym] = bags_children.each_with_object({}) do |bag, bag_child|
          count = bag.to_i
          name = bag.split(/\d+\s(\w+)+/).join.gsub(' ', '_')
          bag_child[name.to_sym] = count unless count.zero?
        end
      end
    end
  end
end
