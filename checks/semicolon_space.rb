#coding: UTF-8

$LOAD_PATH << File.dirname(__FILE__) + '/..'

require 'checks/check'

class SemicolonSpace < Check
	def initialize(attrs)
		@number = attrs["number"]
	end

	def check(file)
		code = strip_comments(file.read)
		empty = 0
		res = 0
		i = 1
		code.each_line do |line|
			line.scan(/(.*?);/).each{|sec|
				spaces = sec[0].length - sec[0].rstrip.length
				if spaces != @number then
					error(file, i, "#{spaces} spaces before semicolon instead of #{@number}")
					res += 1
				end
			}
			i += 1
		end
		return res
	end
end # SemicolonSpace
