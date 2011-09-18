#coding: UTF-8

require './configuration_reader'

if ARGV.length != 1 then
	puts "Usage: ruby #{$0} <config file>"
	exit 1
end

config = ARGV[0]

cf = ConfigurationReader.new(config)
cf.read
