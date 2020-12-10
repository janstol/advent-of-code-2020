# frozen_string_literal: true

require_relative '../solution'

module Day10
  class Solution < Solution

    def solve_part01
      joltages = input.map(&:to_i).sort
      # built_in_joltage = joltages.last + 3
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
      graph = Graph.new

      joltages.each do |joltage|
        node1 = Node.new(joltage)
        graph.add_node(node1)

        graph.nodes.each do |i, node|
          graph.add_edge(node, node1) if (node1.value - node.value).abs.between?(1,3)
        end

      end

      last_node = Node.new(joltages.last + 3)
      graph.add_node(last_node)
      graph.nodes.each do |i, node|
        graph.add_edge(node, last_node) if (last_node.value - node.value).abs.between?(1,3)
      end

      # graph.count_paths()
    end
  end

  class Node
    attr_reader :value, :adjacent_nodes

    def initialize(value)
      @value = value
      @adjacent_nodes = []
    end

    def add_edge(adjacent_node)
      @adjacent_nodes << adjacent_node
    end
  end

  class Graph
    attr_reader :nodes

    def initialize
      @nodes = {}
      @paths_count = 0
    end

    def add_node(node)
      @nodes[node.value] = node
    end

    def add_edge(node1, node2)
      @nodes[node1.value].add_edge(@nodes[node2.value])
      @nodes[node2.value].add_edge(@nodes[node1.value])
    end

    def count_paths(from, to)

    end
  end

end
