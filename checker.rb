#coding: UTF-8

class Checker
	def initialize(checkers)
		@checkers = checkers
	end

	def check(file)
		errors = 0
		@checkers.each{|checker|
			file.seek(0)
			errors += checker.check(file)
		}
		return errors
	end
end # Checker
