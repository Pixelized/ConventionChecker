#coding: UTF-8

require './checks/check'

class Braces < Check
	def initialize(attrs)
		@oneline = attrs["oneline"]
	end

	def check(file)
		res = 0
		i = 1

		file.each_line do |line|
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
