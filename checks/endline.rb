#coding: UTF-8

require './checks/check'

class EndLine < Check
	def initialize(attrs)
		@number = attrs["number"]
		puts "Number : #{@number}"
	end

	def check(file)
		return false
	end
end # EndLine
