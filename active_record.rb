require "active_record"
require "yaml"
require "sqlite3"

ActiveRecord::Base.establish_connection(
  YAML::load(File.open("database.yml")))

ActiveRecord::Schema.define do
  if ActiveRecord::Base.connection.tables.include? 'people'
    drop_table :people
  end

  create_table :people do |table|
    table.column :name,     :string
    table.column :birtday,  :date
    table.column :dorm,     :string
    table.column :room,     :string
    table.column :gpa,      :string
    table.column :country,  :string
    table.column :required, :boolean
    table.column :cost,     :integer
  end
end

class Person < ActiveRecord::Base
end