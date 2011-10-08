#coding: UTF-8

require './checks/accessibility_order'
require './checks/braces'
require './checks/endline'
require './checks/indentation'
require './checks/semicolon_space'

class CheckerFactory
	def self.create(name, attrs)
		case name
			when "AccessibilityOrder"
				return AccessibilityOrder.new(attrs)
			when "Braces"
				return Braces.new(attrs)	
			when "EndLine"
				return EndLine.new(attrs)
			when "Indentation"
				return Indentation.new(attrs)
			when "SemicolonSpace"
				return SemicolonSpace.new(attrs)
			else
				puts "Check module #{name} unknown."
				return nil
		end
	end
end # CheckerFactory
