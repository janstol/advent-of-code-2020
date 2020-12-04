# frozen_string_literal: true

require_relative '../solution'
require 'active_model'

module Day04
  class Solution < Solution

    def solve_part01
      load_passports(Passport).count { |passport| passport.valid? }
    end

    def solve_part02
      load_passports(PassportStrict).count { |passport| passport.valid? }
    end

    private

    def load_passports(passport_class)
      input_raw.split(/\n\n/).map do |pass|
        key_value_strings = pass.split(/([a-z]{3}(?::)[A-Za-z0-9#]*)(?:\\n)*(?:\s)*/).reject { |i| i.blank? }
        attributes = key_value_strings.map { |kv| kv.split(':') }.map do |k, v|
          if k == 'hgt'
            kv = v.split(/(?<=\d)(?=[A-Za-z])/)
            next { k.to_sym => kv[0], hgt_unit: kv[1] }
          end
          { k.to_sym => v }
        end.reduce(&:merge)
        passport_class.new attributes
      end
    end
  end

  class Passport
    include ::ActiveModel::Model

    attr_accessor :byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid, :cid
    attr_accessor :hgt_unit

    validates :byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid, presence: true
    validates :cid, presence: true, if: :any_attr_blank?

    def hgt_cm?
      hgt_unit == 'cm'
    end

    def hgt_in?
      hgt_unit == 'in'
    end

    private

    def any_attr_blank?
      byr.blank? || iyr.blank? || eyr.blank? || hgt.blank? || hcl.blank? || ecl.blank? || pid.blank?
    end
  end

  class PassportStrict < Passport
    validates :byr, length: { is: 4 }, numericality: { greater_than_or_equal_to: 1920, less_than_or_equal_to: 2002 }
    validates :iyr, length: { is: 4 }, numericality: { greater_than_or_equal_to: 2010, less_than_or_equal_to: 2020 }
    validates :eyr, length: { is: 4 }, numericality: { greater_than_or_equal_to: 2020, less_than_or_equal_to: 2030 }
    validates :hgt, numericality: { greater_than_or_equal_to: 150, less_than_or_equal_to: 193 }, if: :hgt_cm?
    validates :hgt, numericality: { greater_than_or_equal_to: 59, less_than_or_equal_to: 76 }, if: :hgt_in?
    validates :hgt_unit, inclusion: { in: %w[cm in] }
    validates :hcl, format: { with: /\A#[0-9a-f]{6}\z/ }
    validates :ecl, inclusion: { in: %w[amb blu brn gry grn hzl oth] }
    validates :pid, format: { with: /\A\d{9}\z/ }
  end
end
