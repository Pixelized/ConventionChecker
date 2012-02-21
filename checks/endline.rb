#coding: UTF-8

$LOAD_PATH << File.dirname(__FILE__) + '/..'

require 'checks/check'

class EndLine < Check
	def initialize(attrs)
		@number = attrs["number"]
	end

	def check(file)
		empty = 0
		file.each_line do |line|
			if line.strip.empty? then
				empty += 1
			else
				empty = 0
			end
		end
		if empty != @number then
			error(file, 0, "#{empty} empty lines instead of #{@number} at end of file")
			return 1
		else
			return 0
		end
	end
end # EndLine
