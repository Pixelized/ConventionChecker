#coding: UTF-8

require './checks/check'

class Indentation < Check
	def initialize(attrs)
		@mode = attrs["mode"].downcase
		@size = attrs["size"]
	end

	def check(file)
		level = 0
		res = 0
		file.each_line do |line|
			if not line.strip.empty? then
				
			end
		end
		return res
	end
end # EndLine
