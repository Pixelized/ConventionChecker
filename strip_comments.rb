#coding: UTF-8

def strip_comments(fin)
	out = ""
	comment = false
	quote = nil

	fin.each_line do |line|
		new_line = ""

		i = 0
		while i < line.size do
			c = line[i]
			case c
				# Escaping \
				when '\\'
					if not comment then
						new_line += c
						i += 1
						new_line += line[i]
					end

				# Quotes
				when '"'
					if not comment then
						new_line += c
						if not quote then
							quote = c
						elsif quote == c then
							quote = nil
						end
					end

				when '\''
					if not comment then
						new_line += c
						if not quote then
							quote = c
						elsif quote == c then
							quote = nil
						end
					end

				# C++ comments and C comments begining
				when '/'
					if quote then
						new_line += c
					elsif line[i + 1] == '/' then
						break
					elsif line[i + 1] == '*' then
						comment = true
						i += 1
					elsif not comment
						new_line += c
					end

				# C comments closing
				when '*'
					if quote then
						new_line += c
					elsif comment and line[i + 1] == '/' then
						comment = false
						i += 1
					elsif not comment
						new_line += c
					end

				else
					if not comment then
						new_line += c if c
					end
			end
			i += 1
		end

		if new_line.strip == "" then
			out += new_line if line.strip == ""
		else
			out += new_line
		end
	end
	return out
end

