require 'rake/testtask'
require 'html2markdown'
require 'nokogiri'
require 'open-uri'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

desc 'Run tests'
task default: :test


namespace :aoc do
  desc 'New day - create directories, files, update readme etc.'
  task :day, [:day] do |_, args|
    day = args.day
    Rake::Task['aoc:create_lib_files'].invoke(day)
    Rake::Task['aoc:create_test_file'].invoke(day)
  end

  desc 'Create lib files for day, update readme,...'
  task :create_lib_files, [:day] do |_, args|
    day = args.day
    day_padded = day.to_s.rjust(2, '0')
    page = Nokogiri::HTML(URI.parse("https://adventofcode.com/2020/day/#{day}").read)
    day_name = page.css('article.day-desc > h2').text.gsub('---', '').gsub("Day #{day}:", '').strip

    # html2markdown
    p = HTMLPage.new contents: page.css('article.day-desc').to_s
    p.li { |_, contents| "- #{contents}" }
    p.em { |_, contents| "**#{contents}**" }
    p.code { |_, contents| contents.include?("\n") ? "```\n#{contents}\n```" : "`#{contents}`" }

    solution_class_template = <<~DYNAMIC
      # frozen_string_literal: true

      require_relative '../solution'

      module Day#{day_padded}
        class Solution < Solution

          def solve_part01
            0
          end

          def solve_part02
            0
          end
        end
      end
    DYNAMIC

    puts '=> Lib:'
    lib_path = "lib/day#{day_padded}"
    unless File.exist?(lib_path)
      puts " Creating '#{lib_path}' ..."
      Dir.mkdir lib_path
    end

    input_path = File.join(lib_path, 'input.txt')
    unless File.file?(input_path)
      puts " Creating '#{input_path}' ..."
      File.write(input_path, '')
    end

    readme_path = File.join(lib_path, 'README.md')
    unless File.file?(readme_path)
      puts " Creating '#{readme_path}' ..."
      File.write(readme_path, p.markdown!)
    end

    solution_path = File.join(lib_path, 'solution.rb')
    unless File.file?(solution_path)
      puts " Creating '#{solution_path}' ..."
      File.write(solution_path, solution_class_template)
    end

    puts '=> Updating main README.md ...'
    File.write('README.md', "| #{day_padded} | [#{day_name}](https://adventofcode.com/2020/day/#{day}) | [solution.rb](lib/day#{day_padded}/solution.rb) | [input.txt](lib/day#{day_padded}/input.txt) |", mode: 'a')
  end

  desc 'Create test file for day, update test_helper'
  task :create_test_file, [:day] do |_, args|
    day = args.day
    day_padded = day.to_s.rjust(2, '0')

    test_class_template = <<~DYNAMIC
      # frozen_string_literal: true

      require 'test_helper'

      module Day#{day_padded}
        class SolutionTest < Minitest::Test

          def setup
            @solution = Solution.new
          end

          def test_day#{day_padded}_part01_example
            @solution = Solution.new 'test/day#{day_padded}/input.txt'
            assert_equal 0, @solution.solve_part01
          end

          def test_day#{day_padded}_part01_solution
            assert_equal 0, @solution.solve_part01
          end

          def test_day#{day_padded}_part02_example
            @solution = Solution.new 'test/day#{day_padded}/input.txt'
            assert_equal 0, @solution.solve_part02
          end

          def test_day#{day_padded}_part02_solution
            assert_equal 0, @solution.solve_part02
          end
        end
      end
    DYNAMIC

    puts '=> Tests:'
    test_dir = "test/day#{day_padded}"
    solution_test_path = "test/day#{day_padded}/solution_test.rb"

    unless File.exist?(test_dir)
      puts " Creating #{test_dir} ..."
      Dir.mkdir test_dir
    end

    unless File.file?(solution_test_path)
      puts " Creating #{solution_test_path} ..."
      File.write(solution_test_path, test_class_template)
    end

    puts ' Updating test_helper ...'
    File.write('test/test_helper.rb', "require 'day#{day_padded}/solution'\n", mode: 'a')
  end
end
