require 'cascade'
require 'json'
require 'date'
require_relative "active_record"

Cascade.configuration do
  Cascade::RowProcessor.use_default_presenter = false
  Cascade::ColumnsMatching.mapping_file = "columns_mapping.yml"
end

class ParserJSON
  def self.open(file)
    JSON.parse(File.read(file))["rows"]
  end
end

class DateParser
  def call(value)
    Date.parse(value)
  end
end

PERSON_SAVER = -> (person_data) { Person.create!(person_data) }

Cascade::DataParser.new(
  row_processor: Cascade::RowProcessor.new(date: DateParser.new),
  data_provider: ParserJSON.open("data_test.json"),
  data_saver: PERSON_SAVER).call

Person.all.map { |person| p person.attributes }
