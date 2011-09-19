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
		i = 1
		ignore = false
		one_line = false
		file.each_line do |line|
			if not line.strip.empty? then
				if line.strip == "/*" or line.strip == "/**" then
					ignore = true
				end

				if not ignore then
					if one_line then
						level += @size
					end
					level -= line.count("}")
					col = line =~ /\S/

					# public:/protected:/private:
					if line.strip == "private:" or line.strip == "protected:" or line.strip == "public:" then
						col += @size
					end

					if col != level then
						puts "Indentation error in #{File.dirname(file)}/#{File.basename(file)}:#{i}"
						res += 1
					end
					level += line.count("{")

					# One line blocks
					if one_line then
						level -= @size
						one_line = false
					end
					obfound = line =~ /\W(for|if|else)\W/
					if obfound and not line[0..obfound].count("//") > 0 and line.count("{") == 0 then
						one_line = true
					end
				else
					if line.strip == "*/" or line.strip == "**/" then
						ignore = false
					end
				end
			end
			i += 1
		end
		return res
	end
end # EndLine
