#coding: UTF-8

require './checker_factory'

require 'json'

class ConfigurationReader
	def initialize(file)
		begin
			pfile = File.open(file, "r")
		rescue
			puts "Error opening #{file}."
			exit 1
		end
		@file = ""
		pfile.each_line do |line|
			@file += line
		end
		pfile.close
	end

	def read
		js = JSON.parse(@file)
		checkers = []
		js.each {|k, v|
			checker = CheckerFactory.create(k, v)
			checkers << checker if checker != nil
		}
		return checkers
	end
end # ConfigurationReader
