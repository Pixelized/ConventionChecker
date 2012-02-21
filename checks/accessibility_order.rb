#coding: UTF-8

$LOAD_PATH << File.dirname(__FILE__) + '/..'

require 'checks/check'

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
		i = 1

		file.each_line do |line|
			if line.strip == "public:" then
				if @unique and l_public != 0 then
					error(file, i, "Multiple public sections defined")
					res += 1
				end
				l_public = i
			elsif line.strip == "protected:" then
				if @unique and l_protected != 0 then
					error(file, i, "Multiple protected sections defined")
					res += 1
				end
				l_protected = i
			elsif line.strip == "private:" then
				if @unique and l_private != 0 then
					error(file, i, "Multiple private sections defined")
					res += 1
				end
				l_private = i
			end
			i += 1
		end

		return res
	end
end # EndLine
