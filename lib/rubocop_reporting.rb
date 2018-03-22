# frozen_string_literal: true

require 'rubocop_reporting/version'
require 'json'

module RubocopReporting
  class CSV
    def initialize(path_to_file = nil)
      @path_to_file = path_to_file
    end

    def generate
      raise FileNotFound if @path_to_file.nil?

      begin
        file = File.read(@path_to_file)
      rescue StandardError
        raise FileNotFound
      end

      unless accepted_formats.include? File.extname(@path_to_file)
        raise FileNotSupported
      end

      JSON.parse(file)
    end

    def accepted_formats
      ['.json']
    end
  end
end
