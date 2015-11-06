require 'cascade'
require_relative 'cascade_csv'

Cascade.configuration do
  Cascade::RowProcessor.use_default_presenter = false
  Cascade::ColumnsMatching.mapping_file = "columns_mapping.yml"
end

Cascade::DataParser.new(data_provider: CascadeCsv.open("data_test.txt")).call
