require "erubis"
require "active_support/inflector"

class Model
  attr_accessor :name, :properties, :fields
  
  def initialize
    @name = ""
    @properties = []
    @fields = []
    yield self if block_given?
    
    @category = ActiveSupport::Inflector.pluralize(@name)

    @tmpl = Template.new(@name)
    properties.map{|p| @tmpl.add_field(p.name, p.field) }
    @fields = @tmpl.fields
    
    create_properties
    create_template
    create_form
    create_category
  end

  def property(name, type="String", field='')
    field = name if field.empty?
    @properties << Property.new(name, type, field)
  end
  
  def create_properties
    @properties.each do |p|
      puts '{{-start-}}'
      puts "'''Property:#{p.name}'''"
      puts "This is a property of type [[Has type::#{p.type}]]."
      puts '{{-stop-}}'
    end
  end
  
  def create_template
    puts '{{-start-}}'
    puts "'''Template:#{@name}'''"
    input = File.read('template.mw.erb')
    erb = Erubis::Eruby.new(input)
    puts erb.result(binding())
    puts '{{-stop-}}'
  end
  
  def create_form
    puts '{{-start-}}'
    puts "'''Form:#{@name}'''"
    input = File.read('form.mw.erb')
    erb = Erubis::Eruby.new(input)
    puts erb.result(binding())
    puts '{{-stop-}}'
  end
  
  def create_category
    puts '{{-start-}}'
    puts "'''Category:#{@category}'''"
    puts "This category uses the form [[Has default form::#{@name}]]."
    puts '{{-stop-}}'
  end
  
  def belongs_to(thing)
    @properties << Property.new("Belongs to #{thing.downcase}", 'Page', "#{thing}")
  end
  
end

class Property
  SMW_TYPES = %w[Page String Text Code URL Email Number Date Enumeration Boolean]
  attr_reader :name, :type, :field
  def initialize(name, type, field)
    @name = name
    @type = type.to_s.capitalize
    @field = field
    raise "Invalid SMW type: #{@type}" unless SMW_TYPES.member?(@type)
  end
  
  def to_smw
    s = "{{-start-}}\n"
    s << "'''Property:#{@name}'''\n"
    s << "This is a property of type [[Has type::#{@type}]].\n"
    s << "{{-stop-}}\n"
    s << "\n"
    s
  end
  
end

class Template
  attr_reader :name, :fields
  
  def initialize(name)
    @name = name
    @fields = []
  end
  
  def add_field(name, label)
    @fields << Field.new(name, label)
  end
  
end

class Field
  attr_reader :name, :label
  def initialize(name, label)
    @name = name
    @label = label
  end
  
end