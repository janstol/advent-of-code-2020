# frozen_string_literal: true

require_relative '../solution'

module Day11
  class Solution < Solution

    def solve_part01
      SeatingSystem.new(input).simulate.occupied_seats
    end

    def solve_part02
      SeatingSystem.new(input).simulate_refined.occupied_seats
    end
  end

  class SeatingSystem
    EMPTY_SEAT = 'L'
    OCCUPIED_SEAT = '#'
    FLOOR = '.'

    attr_reader :layout

    def initialize(input)
      @layout = input.map { |line| line.split // }
      @temp_layout = []
    end

    def simulate
      while @layout != @temp_layout
        @temp_layout = Marshal.load(Marshal.dump(@layout))
        @temp_layout.each_with_index do |row, row_idx|
          row.each_with_index do |char, col_idx|
            adjacents = adjacents_to(row_idx, col_idx).reject { |seat| seat == FLOOR }
            if char == EMPTY_SEAT && adjacents.all? { |seat| seat == EMPTY_SEAT }
              @layout[row_idx][col_idx] = OCCUPIED_SEAT
            elsif char == OCCUPIED_SEAT && adjacents.count { |seat| seat == OCCUPIED_SEAT } >= 4
              @layout[row_idx][col_idx] = EMPTY_SEAT
            else
              # State does not change
            end
          end
        end
      end

      self
    end

    def simulate_refined
      while @layout != @temp_layout
        @temp_layout = Marshal.load(Marshal.dump(@layout))
        @temp_layout.each_with_index do |row, row_idx|
          row.each_with_index do |char, col_idx|
            adjacents = seats_seen_from(row_idx, col_idx).reject { |seat| seat == FLOOR }
            if char == EMPTY_SEAT && adjacents.none? { |seat| seat == OCCUPIED_SEAT }
              @layout[row_idx][col_idx] = OCCUPIED_SEAT
            elsif char == OCCUPIED_SEAT && adjacents.count { |seat| seat == OCCUPIED_SEAT } >= 5
              @layout[row_idx][col_idx] = EMPTY_SEAT
            else
              # State does not change
            end
          end
        end
      end

      self
    end

    def occupied_seats
      @layout.flatten.count { |c| c == SeatingSystem::OCCUPIED_SEAT }
    end

    private

    def adjacents_to(row_idx, col_idx)
      [].tap do |adj|
        adj << @temp_layout[row_idx - 1][col_idx] if row_idx.positive? # top
        adj << @temp_layout[row_idx - 1][col_idx + 1] if row_idx.positive? && col_idx + 1 < @temp_layout[row_idx].size # top right
        adj << @temp_layout[row_idx][col_idx + 1] if col_idx + 1 < @temp_layout[row_idx].size # right
        adj << @temp_layout[row_idx + 1][col_idx + 1] if row_idx + 1 < @temp_layout.size && col_idx + 1 < @temp_layout[row_idx].size # bottom right
        adj << @temp_layout[row_idx + 1][col_idx] if row_idx + 1 < @temp_layout.size # bottom
        adj << @temp_layout[row_idx + 1][col_idx - 1] if row_idx + 1 < @temp_layout.size && col_idx.positive? # bottom left
        adj << @temp_layout[row_idx][col_idx - 1] if col_idx.positive? # left
        adj << @temp_layout[row_idx - 1][col_idx - 1] if row_idx.positive? && col_idx.positive? # top left
      end
    end

    def seats_seen_from(row_idx, col_idx)
      [].tap do |seats|
        seats << find_seat_in_dir(row_idx, col_idx, -1, 0) # TOP
        seats << find_seat_in_dir(row_idx, col_idx, -1, 1) # TOP RIGHT
        seats << find_seat_in_dir(row_idx, col_idx, 0, 1) # RIGHT
        seats << find_seat_in_dir(row_idx, col_idx, 1, 1) # BOTTOM RIGHT
        seats << find_seat_in_dir(row_idx, col_idx, 1, 0) # BOTTOM
        seats << find_seat_in_dir(row_idx, col_idx, 1, -1) # BOTTOM LEFT
        seats << find_seat_in_dir(row_idx, col_idx, 0, -1) # LEFT
        seats << find_seat_in_dir(row_idx, col_idx, -1, -1) # TOP LEFT
      end.compact
    end

    def find_seat_in_dir(row_idx, col_idx, row_dir, col_dir)
      row_idx += row_dir
      col_idx += col_dir
      return if row_idx.negative? || row_idx > @temp_layout.size - 1 || col_idx.negative? || col_idx > @temp_layout[row_idx].size - 1
      return @temp_layout[row_idx][col_idx] unless @temp_layout[row_idx][col_idx] == FLOOR

      find_seat_in_dir(row_idx, col_idx, row_dir, col_dir)
    end
  end

end
