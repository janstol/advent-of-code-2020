# frozen_string_literal: true

require_relative '../solution'

module Day12
  class Solution < Solution

    def solve_part01
      Ship.new(input).start.distance
    end

    def solve_part02
      Ship.new(input, waypoint: { x: 10, y: -1 }).start(true).distance
    end
  end

  class Ship
    DIRECTIONS = { north: { deg: 0, x: 0, y: -1 },
                   east: { deg: 90, x: 1, y: 0 },
                   south: { deg: 180, x: 0, y: 1 },
                   west: { deg: 270, x: -1, y: 0 } }.freeze
    DEG_DIRECTIONS = { '0': :north, '90': :east, '180': :south, '270': :west }.freeze

    def initialize(input, coords: { x: 0, y: 0 }, waypoint: { x: 0, y: 0 })
      @input = input
      @coords = coords
      @waypoint = waypoint
      @direction = DIRECTIONS[:east]
    end

    def start(waypoint = false)
      @input.each do |instruction|
        action, value = instruction.split(/([NSEWLRF])(\d+)/).reject { |c| c.blank? }
        move(action, value.to_i, waypoint)
      end
      self
    end

    def distance
      @coords[:x].abs + @coords[:y].abs
    end

    private

    def move(action, value, waypoint = false)
      case action
      when 'N'
        waypoint ? @waypoint[:y] -= value : @coords[:y] -= value
      when 'S'
        waypoint ? @waypoint[:y] += value : @coords[:y] += value
      when 'E'
        waypoint ? @waypoint[:x] += value : @coords[:x] += value
      when 'W'
        waypoint ? @waypoint[:x] -= value : @coords[:x] -= value
      when 'L', 'R'
        waypoint ? rotate_waypoint(value, action) : rotate(value, action)
      when 'F'
        waypoint ? move_forward_to_waypoint(value) : move_forward(value)
      else
        raise NotImplementedError
      end
    end

    def move_forward(distance)
      @coords[:x] += distance * @direction[:x]
      @coords[:y] += distance * @direction[:y]
    end

    def rotate(degrees, direction)
      dir = direction == 'L' ? -1 : 1
      degrees = (@direction[:deg] + (dir * degrees) % 360) % 360
      @direction = DIRECTIONS[DEG_DIRECTIONS["#{degrees}".to_sym]]
    end

    def rotate_waypoint(degrees, direction)
      dir = direction == 'L' ? -1 : 1
      degrees = (dir * degrees) % 360

      case degrees
      when 90
        tmp_way_x = @waypoint[:x]
        @waypoint[:x] = -@waypoint[:y]
        @waypoint[:y] = tmp_way_x
      when 180
        @waypoint[:y] = -@waypoint[:y]
        @waypoint[:x] = -@waypoint[:x]
      when 270
        tmp_way_x = @waypoint[:x]
        @waypoint[:x] = @waypoint[:y]
        @waypoint[:y] = -tmp_way_x
      else
        raise NotImplementedError
      end
    end

    def move_forward_to_waypoint(distance)
      @coords[:x] += distance * @waypoint[:x]
      @coords[:y] += distance * @waypoint[:y]
    end

  end
end
