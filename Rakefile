require "model.rb"
require "bot.rb"
include FileUtils

PYBOT_PATH='/Users/kraut/mediawiki/pywikipedia'

$model = ENV['model'] || 'sample.rb'  

desc 'run model [model=]'
task :run do
  fork do
    eval(File.read($model))
  end
end

desc 'update wiki'
task :update do
  wd=Dir.getwd
  `ruby dsl.rb > tmp.mediawiki`
  cp 'tmp.mediawiki', PYBOT_PATH
  cd PYBOT_PATH
  sh "python pagefromfile.py -putthrottle:01 -force -file:tmp.mediawiki"
  cd wd
end