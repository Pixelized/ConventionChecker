#coding: UTF-8

require './checker'
require './configuration_reader'

if ARGV.length < 2 then
	puts "Usage: ruby #{$0} <config file> <source files>"
	exit 1
end

config = ARGV[0]

cf = ConfigurationReader.new(config)
ch = Checker.new(cf.read)

res = 0

for i in 1...ARGV.length do
	begin
		f = File.open(ARGV[i], "r")
	rescue
		puts "Error opening #{ARGV[i]}."
	end

	if f != nil then
		res += ch.check(f)
		f.close
	end
end

if res > 0 then
	if res == 1
		puts "1 error."
	else
		puts "#{res} errors."
	end
end

exit res
