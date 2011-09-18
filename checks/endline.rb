#coding: UTF-8

require './checks/check'

class EndLine < Check
	def initialize(attrs)
		@number = attrs["number"]
	end

	def check(file)
		empty = 0
		file.each_line do |line|
			if line.strip.empty?
				empty += 1
			else
				empty = 0
			end
		end
		if empty != @number then
			puts "#{empty} empty lines instead of #{@number} at end of file #{File.dirname(file)}/#{File.basename(file)}"
			return 1
		else
			return 0
		end
	end
end # EndLine
