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
	end

	def read
		js = JSON.parse(@file)
		js.each {|k, v|
			CheckerFactory.create(k, v)
		}
	end
end # ConfigurationReader
