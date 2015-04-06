require 'cascade'
require 'json'

Cascade.configuration do
  Cascade::RowProcessor.use_default_presenter = false
  Cascade::ColumnsMatching.mapping_file = "columns_mapping.yml"
end

class ParserJSON
  def open(file)
    JSON.parse(File.read(file))["rows"]
  end
end

Cascade::DataParser.new("data_test.json", data_provider: ParserJSON.new).call
