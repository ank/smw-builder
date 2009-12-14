require "model.rb"

include FileUtils

PYBOT_PATH='/Users/kraut/mediawiki/pywikipedia'

$model = ENV['model'] || 'sample.rb'  

desc 'run model [model=]'
task :run do
  fork do
    eval(File.read($model))
  end
end

desc 'generate property pages from a file'
task :properties do
  file = ENV['f']
  raise "No file specified [f=]" if file.nil? or !File.exists?(file)
  properties = File.readlines(file)
  properties.each do |p|
    p.chomp!
    prop = Property.new(p, 'String', p)
    puts prop.to_smw
  end
end