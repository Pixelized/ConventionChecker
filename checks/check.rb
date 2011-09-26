#coding: UTF-8

class Check
	def check(file)
		return false
	end

	def error(file, line, message)
		puts "#{message} in #{File.dirname(file)}/#{File.basename(file)}:#{line}"
	end
end # Check
