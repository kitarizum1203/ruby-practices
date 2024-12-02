#!/usr/bin/env ruby
require "date"
require "optparse"

# 処理しやすいため初期化
year = nil
month = nil

today = Date.today

opt = OptionParser.new
opt.on('-y year') {|y| year = y.to_i } 
opt.on('-m month') {|m| month =  m.to_i }
opt.parse!(ARGV)

year ||= today.year
month ||= today.month

first_date = Date.new(year, month, 1) 
last_date = Date.new(year, month, -1) 

date_title = Date.new(year, month) 
puts date_title.strftime("%B %Y").center(20) 
puts "Su Mo Tu We Th Fr Sa" 

print "   " * first_date.wday


(first_date..last_date).each do |date|
  print date.day.to_s.rjust(2)
  print "\n" if date.saturday?
  print " " unless date.saturday?  
end
