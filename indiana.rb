# Model.new do |s|
#   s.name = 'Sample'
#   s.property 'Status', :string, 'Status'
#   
#   # Field set A
#   s.property 'Carrier', :string, 'Carrier'
#   s.property 'Tracking number', :string, 'Tracking number'
#   s.property 'Sender', :string, 'Sender'
#   s.property 'Type of sample', :string, 'Type of sample'
#   
#   # Field set B
#   s.property 'Lab member received', :string, 'Lab member received'
#   s.property 'Date received and stored', :date, 'Date received and stored'
#   s.property 'Location stored', :string, "Location stored"
#   
#   # Field set C
#   s.property 'Project number', :number, 'Project number'
#   s.property 'Intended use of sample', :string, 'Intended use of sample'
#   s.property 'QA lab member assigned', :page, 'QA lab member assigned'
#   
#   # Field set D
#   s.property 'QA lab member', :page, 'QA lab member'
#   s.property 'QA date', :date, 'QA date'
#   s.property 'QA type', :string, 'QA type'
#   s.property 'QA note', :text, 'QA note'
#   
# end
# 
# Model.new do |l|
#   l.name = 'Library'
#   l.property "Status", :string , 'Status'
#   
#   # Field set A
#   l.property "Sample number", :string, 'Sample'
#   l.property "PI", :string, 'PI'
#   l.property "Project name", :string, 'Project name'
#   l.property "Library type", :string, 'Library type'
#   l.property "PO confirmation", :string, 'PO confirmation'
#   
#   # Field set B
#   l.property "Lab member assigned to prepare library", :string, "Lab member assigned to prepare library"
#   l.property "Notes on preparation", :text, "Notes on preparation"
#   
#   # Field set C
#   l.property "Sample receipt confirmed", :string, "Sample receipt confirmed"
#   l.property "Sample QA confirmed", :string, "Sample QA confirmed"
#   l.property "Proposed schedule of library prep", :date, "Proposed schedule of library prep"
#   
#   # Field set D
#   l.property "Prep stage 1 QC", :string, "Prep stage 1 QC"
#   l.property "Prep stage 2 QC", :string, "Prep stage 2 QC"
#   l.property "Prep stage 3 QC", :string, "Prep stage 3 QC"
#   l.property "Prep stage 4 QC", :string, "Prep stage 4 QC"
#   
#   # Field set E
#   l.property "Final library trace", :string, "Final library trace"
#   l.property "Final library quant.", :string, "Final library quant"
#   l.property "Final library comments", :text, "Final library comments"
#   
# end

Model.new do |s|
  s.name = "Sequencing"
  s.property "Sequencing status"
  
  # Field set A
  
  s.property "Final library trace"
  s.property "Final library quant"
  s.property "Final library comments"

  # Field set B
  
  s.property "Lab member assigned to titrate library"
  s.property "Notes on titration"

  # Field set C
  
  s.property "Library receipt confirmed"
  s.property "Reagents reserved"
  s.property "Proposed schedule for quant and titration"

  # Field set D
  
  s.property "Titration completed"
  s.property "Titration results"
  
  # Field set E
  
  s.property "PTP/Flowcell plan"
  s.property "Run date plan"
 
  # Field set F
  
  s.property "Lab member assigned bulk"
  s.property "Lab member assigned enrichment"
  s.property "Lab member assigned run"
                                  
  s.property "Lab member assigned cluster generation"
  s.property "Lab member assigned cluster QA"
  
  # Field set G
  
  s.property "Assignment of bulk confirmed"
  s.property "Bulk reagents reserved"
  s.property "Proposed schedule for bulk"
  s.property "Assignment of enrichment confirmed"
  s.property "Enrichment reagents reserved"
  s.property "Proposed schedule for enrichment"
  s.property "Assignment of run set-up confirmed" 
  s.property "Run reagents reserved"
  s.property "Proposed schedule for run"
  
  # Field set H
  
  s.property "Cycling of bulk confirmed"
  s.property "Cycle numbers used for bulk"
  s.property "Completion of enrichment confirmed"
  s.property "Enrichment results tabulated"
  s.property "Completion of run set-up confirmed"
  s.property "Loading of PTP regions or labeling of flowcell lanes confirmed"
  s.property "Assignment of processing and analysis script confirmed"

  
end