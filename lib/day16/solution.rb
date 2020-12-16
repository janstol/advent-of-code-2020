# frozen_string_literal: true

require_relative '../solution'

module Day16
  class Solution < Solution

    def solve_part01
      TicketLoader.new(input_raw).invalid_tickets.sum
    end

    def solve_part02
      TicketLoader.new(input_raw).my_ticket.select { |name, _v| name.start_with?('departure') }.map { |_n, value| value }.reduce(&:*)
    end

  end

  class TicketLoader

    def initialize(input_raw)
      parse_input(input_raw)
    end

    def invalid_tickets
      @invalid_tickets ||= (@nearby_tickets - valid_tickets).map do |t|
        t.select do |tt|
          !ranges.any? { |r| r.include?(tt) }
        end
      end.flatten
    end

    def valid_tickets
      @valid_tickets ||= @nearby_tickets.select do |t|
        t.all? do |val|
          ranges.any? { |r| r.include?(val) }
        end
      end
    end

    def ranges
      @ranges ||= @fields.map { |f| f[:ranges] }.flatten
    end

    def my_ticket
      fields = field_possibilities
      headers = []
      j = 0
      while j < fields.first[:possibilities].size
        field = fields.select { |f| f[:possibilities].count { |p| p == true } == 1 }.first
        index = field[:possibilities].index(true)
        headers[index] = field[:name]
        fields.each { |f| f[:possibilities][index] = false }
        j += 1
      end

      headers.map.with_index { |h, i| { h => @my_ticket[i] } }.reduce(&:merge)
    end

    private

    def parse_input(input_raw)
      fields_raw, my_ticket_raw, nearby_tickets_raw = input_raw.split(/\n\n/)
      @fields = fields_raw.split(/\n/).map do |note|
        name, ranges = note.split(': ')
        ranges = ranges.split(' or ').map do |r|
          from, to = r.split('-')
          ((from.to_i)..(to.to_i))
        end
        { name: name, ranges: ranges }
      end
      @my_ticket = my_ticket_raw.split(/:\n/).last.split(',').map(&:to_i)
      @nearby_tickets = nearby_tickets_raw.split(/:\n/).last.split(/\n/).map { |ticket| ticket.split(',').map(&:to_i) }
    end

    def field_possibilities
      @fields.map do |field|
        p = field[:ranges].map do |r|
          valid_tickets.map do |t|
            t.map { |tt| r.include?(tt) }
          end
        end.transpose.map { |a, b| a.zip(b).map { |x, y| x | y } }

        { name: field[:name], possibilities: p.reduce { |p, b| p.zip(b).map { |x, y| x & y } } }
      end
    end
  end
end
