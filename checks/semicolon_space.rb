#coding: UTF-8

require './checks/check'

class SemicolonSpace < Check
	def initialize(attrs)
		@number = attrs["number"]
	end

	def check(file)
		empty = 0
		res = 0
		i = 1
		file.each_line do |line|
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
