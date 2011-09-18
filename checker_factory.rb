#coding: UTF-8

require './checks/endline'

class CheckerFactory
	def self.create(name, attrs)
		case name
			when "EndLine"
				return EndLine.new(attrs)
			else
				puts "Check module #{name} unknown."
				return nil
		end
	end
end # CheckerFactory
