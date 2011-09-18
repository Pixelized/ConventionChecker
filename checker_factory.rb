#coding: UTF-8

require './checks/accessibility_order'
require './checks/endline'

class CheckerFactory
	def self.create(name, attrs)
		case name
			when "AccessibilityOrder"
				return AccessibilityOrder.new(attrs)
			when "EndLine"
				return EndLine.new(attrs)
			else
				puts "Check module #{name} unknown."
				return nil
		end
	end
end # CheckerFactory