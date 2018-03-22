# frozen_string_literal: true

require 'rubocop_reporting/version'
require 'json'
require 'csv'

module RubocopReporting
  class ToCSV
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

      generate_csv_file(file)
    end

    def accepted_formats
      ['.json']
    end

    def generate_csv_file(file)
      result = processing_json(file)
      CSV.open("#{Dir.pwd}/rubocop_reporting.csv", 'wb') do |csv|
        csv << result.keys
        csv << result.values
      end
    end

    def processing_json(file)
      result = {}
      json = JSON.parse(file)

      json['files'].each do |json_file|
        json_file['offenses'].each do |offense|
          cop_name = offense['cop_name'].split('/')[0]
          result[cop_name] = result[cop_name].nil? ? 1 : (result[cop_name] + 1)
        end
      end

      result
    end
  end
end
