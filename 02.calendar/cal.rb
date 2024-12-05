#!/usr/bin/env ruby
require "date"
require "optparse"

year = nil
month = nil

opt = OptionParser.new
opt.on('-y year') {|y| year = y.to_i } 
opt.on('-m month') {|m| month =  m.to_i }
opt.parse!(ARGV)

today = Date.today
year ||= today.year
month ||= today.month

first_date = Date.new(year, month, 1) 
last_date = Date.new(year, month, -1) 

puts first_date.strftime("%B %Y").center(20) 
puts "Su Mo Tu We Th Fr Sa" 

print "   " * first_date.wday

(first_date..last_date).each do |date|
  print (date.day.to_s.rjust(2))
  if date.saturday?
    print "\n"
  else
    print " "
  end
end
