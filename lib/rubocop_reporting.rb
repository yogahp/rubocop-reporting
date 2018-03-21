# frozen_string_literal: true

require 'rubocop_reporting/version'

module RubocopReporting
  class CSV
    def initialize(path_to_file = nil)
      @path_to_file = path_to_file
    end

    def generate
      raise FileNotFound if @path_to_file.nil?

      begin
        File.read(@path_to_file)
      rescue StandardError
        raise FileNotFound
      end

      puts 'Rubocop reporting has been generated'
    end
  end
end
