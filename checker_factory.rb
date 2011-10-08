#coding: UTF-8

Dir[File.dirname(__FILE__) + '/checks/*.rb'].each{|file|
	require File.dirname(file) + '/' + File.basename(file, File.extname(file))
}

class CheckerFactory
	def self.create(name, attrs)
		begin
			Kernel.const_get(name).new(attrs)

			rescue NameError
				$stderr.puts "Check module #{name} unknown."
			end
	end
end # CheckerFactory
