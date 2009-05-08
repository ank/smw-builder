Model.new do |p|
  p.name = 'Project'
  p.property 'Project name', :string, 'Name'
  p.property 'Project type', :string, 'Type'
  p.property 'Project description', :text, 'Description'
  p.property 'Project date', :date, 'Date'
  p.property 'Project owner', :string, 'Owner'
end

Model.new do |s|
  s.name = 'Sample'
  s.belongs_to 'Project'
  %w[name type species source external_accession external_db].each do |p|
    s.property "Sample #{p}", :string, p.gsub(/\_/," ").capitalize
  end
  s.property 'Description', :text, 'Description'
end