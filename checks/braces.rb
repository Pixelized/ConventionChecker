#coding: UTF-8

$LOAD_PATH << File.dirname(__FILE__) + '/..'

require 'checks/check'

class Braces < Check
	def initialize(attrs)
		@oneline = attrs["oneline"]
	end

	def check(file)
		code = strip_comments(file.read)
		res = 0
		i = 1

		code.each_line do |line|
			if line.count("{") > 0 then
				if @oneline and line.strip == "{" then
					res += 1
					error(file, i, "Bad placement of brace")
				end
			end
			i += 1
		end
		return res
	end
end # Braces
