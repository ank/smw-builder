require "tempfile"
# 
# xxxx
# '''PageName'''
# Text here
# 
# yyyy
# xxxx
# '''AnotherPageName'''
# Another text
# yyyy
#

module Bot
  BOT_OPTS='-force'
  PYBOT="python /Users/kraut/mediawiki/pywikipedia #{BOT_OPTS}"
  
  def text_to_tempfile(text)
    temp_file = Tempfile.new
    temp_file.write text
    temp_file.flush
    return temp_file
  end
  
  def page_from_file(page_name, file)
    temp_file = Tempfile.new
    res = `#{PYBOT} pagefromfile.py -file:#{file.path}`
  end
  
end