# frozen_string_literal: true

require_relative '../solution'

module Day08
  class Solution < Solution

    def solve_part01
      Computer.new(input).run.accumulator
    end

    def solve_part02
      debug_program
    end

    private

    def debug_program
      jmps_nops = input.each_with_index.map { |instr, i| i if instr.start_with?('jmp') || instr.start_with?('nop') }.compact

      jmps_nops.each do |index|
        temp_input = input.clone.map(&:clone)

        if temp_input[index].start_with?('jmp')
          temp_input[index].gsub!('jmp', 'nop')
        else
          temp_input[index].gsub!('nop', 'jmp')
        end

        computer = Computer.new(temp_input).run
        return computer.accumulator unless computer.infinite_loop
      end

      nil
    end
  end

  class Computer
    attr_reader :accumulator, :infinite_loop

    def initialize(instructions)
      @instructions = instructions
      @accumulator = 0
      @position = 0
      @instructions_count = {}
      @infinite_loop = false
    end

    def run
      run_operation_at(0)
      self
    end

    private

    def run_operation_at(index)
      return if index >= @instructions.size

      op = operation_at(index)
      return @infinite_loop = true if @instructions_count[index.to_s] == 2

      case op[:name]
      when :acc
        @accumulator += op[:arg]
        run_operation_at(@position += 1)
      when :jmp
        run_operation_at(@position += op[:arg])
      when :nop
        run_operation_at(@position += 1)
      else
        raise NotImplementedError
      end
    end

    # def run_operation(name:, arg:)
    #   return if @instructions_count.values.any? { |v| v >= 2 }
    #   case name.to_sym
    #   when :acc
    #     @accumulator += arg
    #     run_operation(**operation_at(@position += 1))
    #   when :jmp
    #     run_operation(**operation_at(@position += arg))
    #   else
    #     #nop
    #   end
    # end

    def operation_at(index)
      name, arg = @instructions[index].split
      @instructions_count[index.to_s] = 0 unless @instructions_count.has_key?(index.to_s)
      @instructions_count[index.to_s] += 1
      { name: name.to_sym, arg: arg.to_i }
    end
  end
end
