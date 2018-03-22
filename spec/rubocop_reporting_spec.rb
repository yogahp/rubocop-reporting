# frozen_string_literal: true

RSpec.describe RubocopReporting do
  it 'has a version number' do
    expect(RubocopReporting::VERSION).not_to be nil
  end

  it do
    rubocop_reporting = RubocopReporting::CSV.new
    expect { rubocop_reporting.generate }.to raise_error(FileNotFound)
  end

  it do
    rubocop_reporting = RubocopReporting::CSV.new('path')
    expect { rubocop_reporting.generate }.to raise_error(FileNotFound)
  end

  it do
    path = "#{Dir.pwd}/spec/files/wrong_file.txt"
    rubocop_reporting = RubocopReporting::CSV.new(path)
    expect { rubocop_reporting.generate }.to raise_error(FileNotSupported)
  end

  it do
    path = "#{Dir.pwd}/spec/files/rubocop_wrong_content.json"
    rubocop_reporting = RubocopReporting::CSV.new(path)
    expect { rubocop_reporting.generate }.to raise_error(JSON::ParserError)
  end
end
