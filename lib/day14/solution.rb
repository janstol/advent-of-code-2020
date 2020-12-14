# frozen_string_literal: true

require_relative '../solution'

module Day14
  class Solution < Solution

    def solve_part01
      Program.new(input).execute.mem.values.sum
    end

    def solve_part02
      ProgramV2.new(input).execute.mem.values.sum
    end
  end

  class Program
    attr_accessor :mem

    def initialize(input)
      @input = input
      @bitmask = []
      @mem = {}
    end

    def execute
      @input.each do |line|
        next parse_mask(line) unless line.start_with?('mem')
        execute_instruction(line)
      end

      self
    end

    private

    def execute_instruction(input)
      instruction = parse_instruction(input)
      value_bin = instruction[:val].to_s(2).rjust(36, '0')
      @bitmask.each_with_index do |bit, i|
        next if bit == 'X'
        value_bin[i] = bit
      end

      @mem[instruction[:ptr]] = value_bin.to_i(2)
    end

    def parse_mask(input)
      @bitmask = input.split(' = ').last.split('')
    end

    def parse_instruction(input)
      mem_instr, arg = input.split(' = ')
      { ptr: mem_instr.split(/mem\[(\d+)\]/).reject(&:blank?).first.to_i, val: arg.to_i }
    end
  end

  class ProgramV2 < Program
    private

    def execute_instruction(input)
      instruction = parse_instruction(input)
      result = instruction[:ptr].to_s(2).rjust(36, '0').split('')
      @bitmask.each_with_index do |bit, i|
        next if bit == "0"
        result[i] = bit
      end

      n = result.count { |c| c == 'X' }
      [0, 1].repeated_permutation(n).each do |combo|
        address = []
        result.each_with_index { |r, i| r == 'X' ? address[i] = combo.shift : address[i] = r }
        @mem[address.join.to_i(2)] = instruction[:val]
      end
    end
  end
end
