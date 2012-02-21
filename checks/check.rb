#coding: UTF-8

$LOAD_PATH << File.dirname(__FILE__) + '/..'

require 'strip_comments'

class Check
	def check(file)
		return false
	end

	def error(file, line, message)
		puts "#{message} in #{File.dirname(file)}/#{File.basename(file)}:#{line}"
	end
end # Check
