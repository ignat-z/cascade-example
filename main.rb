require 'cascade'

Cascade.configuration do
  Cascade::RowProcessor.use_default_presenter = false
  Cascade::ColumnsMatching.mapping_file = "columns_mapping.yml"
end

Cascade::DataParser.new("data_test.txt").call
