require "sequel"
require "model"

#
# Inspect a RDBMS and create
# SMW Properties, Templates, Forms, and Categories
#
# Works on PostgreSQL, MySQL, SQLite, and JDBC
#

# TODO: put this in a yaml file
DB = Sequel.mysql('sequencing_dev', :user => 'root', :password => 'mysqlroot12#', :host => 'localhost')

DB.tables.each do |table|
  
  model_name = table.to_s.gsub(/\_/, " ").downcase.capitalize
  properties = []
  
  DB.schema(table).each do |c|
    # property_name = model_name + " " + c[0].to_s.gsub(/\_/," ")
    property_name = c[0].to_s.gsub(/\_/," ").capitalize
    property_type = c[1][:type]
    label = c[0].to_s
    property_type = :number if property_type == :integer or property_type == :float
    property_type = :date if property_type == :datetime
    property_type = :string if property_type == nil
    properties << Property.new(property_name, property_type, label)
  end
  
  # TODO: Do something smart with primary and foreign keys
  #properties.reject!{|p| p.name =~ /id/ }
  
  Model.new do |m|
    m.name = model_name
    m.properties = properties
  end
  
end