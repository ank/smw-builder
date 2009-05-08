#
# Basic ruby DSL for SMW
#
#

Model.new do |m|
  m.name = 'Project'
  m.property 'Has name', :string, 'Name'
  m.property 'Has description', :text, 'Description'
end

Model.new do |m|
  m.name = 'Sample'
  m.property 'Species name', :string, 'Species'
  m.belongs_to 'Project'
end

#
# TODO: express relationships
# 
# Model.new do |m|
#   m.name = 'Sample'
#   belongs_to 'Project'
#   has_many 'Sequencing Runs'
#   has_many = 'Technicians'
# end