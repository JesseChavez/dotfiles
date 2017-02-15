# custom .irbrc to enable autocompletion
# in irb, rvm has a custom script that sets up things like this

require 'irb/completion'
IRB.conf[:PROMPT_MODE] = :SIMPLE
