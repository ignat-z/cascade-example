require 'cascade'
require 'awesome_print'

PUTS_DATA_SAVER = ->(*args) { ap args }

Cascade.configuration do
  Cascade::RowProcessor.use_default_presenter = false
  Cascade::ColumnsMatching.mapping_file = "columns_mapping.yml"
end

Cascade::DataParser.new("data_test.txt", data_saver: PUTS_DATA_SAVER).call
