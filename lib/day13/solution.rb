# frozen_string_literal: true

require_relative '../solution'

module Day13
  class Solution < Solution

    def solve_part01
      estimate_timestamp = input[0].to_i
      result = input[1].gsub('x,', '').split(',').map do |bus_id|
        { bus_id: bus_id.to_i, wait_minutes: bus_id.to_i - (estimate_timestamp % bus_id.to_i) }
      end.min_by { |hash| hash[:wait_minutes] }

      result[:bus_id] * result[:wait_minutes]
    end

    def solve_part02
      buses = load_buses
      mods = buses.keys.map(&:to_i)
      remainders = buses.values.map(&:to_i)

      chinese_remainder mods, remainders
    end

    private

    def load_buses
      input[1].split(',').map.with_index do |bus_id, t|
        next {} if bus_id == 'x'
        { bus_id => -t }
      end.reduce(&:merge)
    end

    # Source: https://rosettacode.org/wiki/Chinese_remainder_theorem#Ruby
    def chinese_remainder(mods, remainders)
      max = mods.inject(:*)
      series = remainders.zip(mods).map { |r, m| (r * max * invmod(max / m, m) / m) }
      series.inject(:+) % max
    end

    def extended_gcd(a, b)
      last_remainder, remainder = a.abs, b.abs
      x, last_x, y, last_y = 0, 1, 1, 0
      while remainder != 0
        last_remainder, (quotient, remainder) = remainder, last_remainder.divmod(remainder)
        x, last_x = last_x - quotient * x, x
        y, last_y = last_y - quotient * y, y
      end

      [last_remainder, last_x * (a < 0 ? -1 : 1)]
    end

    def invmod(e, et)
      g, x = extended_gcd(e, et)
      if g != 1
        raise 'Multiplicative inverse modulo does not exist!'
      end

      x % et
    end
  end
end
