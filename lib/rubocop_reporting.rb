# frozen_string_literal: true

require 'rubocop_reporting/version'

module RubocopReporting
  class CSV
    def initialize(file = nil)
      @file = file
    end

    def generate
      raise FileNotFound if @file.nil?
      puts 'Rubocop reporting has been generated'
    end
  end
end
