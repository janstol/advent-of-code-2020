# frozen_string_literal: true

require_relative '../solution'

module Day05
  class Solution < Solution

    def solve_part01
      input.map { |str| BoardingPass.parse_from_string(str).seat_id }.max
    end

    def solve_part02
      ids = input.map { |str| BoardingPass.parse_from_string(str).seat_id }.sort
      (Array(ids.min..ids.max) - ids).first
    end
  end

  class BoardingPass
    ROWS = Array(0...128).freeze
    COLUMNS = Array(0...8).freeze

    attr_reader :seat_row, :seat_column

    # @param [Integer] seat_row
    # @param [Integer] seat_column
    def initialize(seat_row, seat_column)
      @seat_row = seat_row
      @seat_column = seat_column
    end

    # @param [String] str
    def self.parse_from_string(str)
      rows = ROWS
      middle_row = ROWS.length / 2
      columns = COLUMNS
      middle_column = COLUMNS.length / 2

      str.each_char do |char|
        case char
        when 'F', 'B' # rows: F - lower half, B - upper half
          rows = char == 'F' ? rows[0...middle_row] : rows[middle_row..-1]
          middle_row = rows.length / 2
        when 'L', 'R' # cols: L - lower half, R - upper half
          columns = char == 'L' ? columns[0...middle_column] : columns[middle_column..-1]
          middle_column = columns.length / 2
        else
          raise NotImplementedError
        end
      end

      raise StandardError, "rows: #{rows}, columns: #{columns}" if rows.size != 1 || columns.size != 1

      new(rows.first, columns.first)
    end

    def seat_id
      (seat_row * 8) + seat_column
    end
  end
end
