#coding: UTF-8

require './checks/check'

class AccessibilityOrder < Check
	def initialize(attrs)
		@order = attrs["order"]
		@unique = attrs["unique"]
	end

	def check(file)
		l_public = 0
		l_protected = 0
		l_private = 0

		res = 0
		i = 0

		file.each_line do |line|
			if line.strip == "public:" then
				if @unique and l_public != 0 then
					puts "Multiple public section defined in #{File.dirname(file)}/#{File.basename(file)} (redefined line #{i})"
					res += 1
				end
				l_public = i
			elsif line.strip == "protected:" then
				if @unique and l_protected != 0 then
					puts "Multiple protected section defined in #{File.dirname(file)}/#{File.basename(file)} (redefined line #{i})"
					res += 1
				end
				l_protected = i
			elsif line.strip == "private:" then
				if @unique and l_private != 0 then
					puts "Multiple private section defined in #{File.dirname(file)}/#{File.basename(file)} (redefined line #{i})"
					res += 1
				end
				l_private = i
			end
			i += 1
		end

		return res
	end
end # EndLine
