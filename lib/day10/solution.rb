# frozen_string_literal: true

require_relative '../solution'

module Day10
  class Solution < Solution

    def solve_part01
      joltages = input.map(&:to_i).sort
      differences = { '3' => 1 }

      previous_joltage = 0
      joltages.each do |joltage|
        difference = (joltage - previous_joltage).to_s
        previous_joltage = joltage

        differences[difference] = 0 unless differences.has_key?(difference)
        differences[difference] += 1
      end

      differences['1'] * differences['3']
    end

    def solve_part02
      joltages = input.map(&:to_i).sort
      built_in_joltage = joltages.last + 3
      count_adapter_arangements(joltages, 0, built_in_joltage)
    end

    private

    def count_adapter_arangements(joltages, prev_joltage, built_in_joltage, cache = {})
      count = 0

      joltages.each_with_index do |joltage, i|
        break if prev_joltage + 3 < joltage
        break count += 1 if joltage + 3 == built_in_joltage
        break if joltage + 3 >= built_in_joltage

        cache[joltage] = count_adapter_arangements(joltages[i + 1..-1], joltage, built_in_joltage, cache) unless cache.has_key?(joltage)
        count += cache[joltage]
      end

      count
    end
  end

end
