#!/usr/bin/env ruby
# ライブラリを読み込む
require "date"
require "optparse"

# 各パラメータの設定
year = nil
month = nil
today = Date.today

# コマンドラインのオプションの設定
opt = OptionParser.new
opt.on('-y year') {|y| year = y.to_i } 
opt.on('-m month') {|m| month =  m.to_i }
opt.parse!(ARGV)

# コマンド引数を指定しない場合
if (year.nil?) && (month.nil?) # 年も月も指定しない場合、今年の今月のカレンダーを表示
  year = today.year
  month = today.month
elsif year.nil? # 年を指定しない場合、今年の指定した月のカレンダーを表示
  year = today.year
elsif month.nil? # 月を指定しない場合、今年の指定した月のカレンダーを表示
  month = today.month
end

first_day = Date.new(year, month, 1) # 対象の年月から初日を取得
last_day = Date.new(year, month, -1) # 対象の年月から最終日を取得

title = Date.new(year, month) # Dateクラスのインスタンスを作成
puts title.strftime("%B %Y").center(20) #雛形を月の名称と西暦で表示
puts "Su Mo Tu We Th Fr Sa" # 曜日を表示

print "   " * first_day.wday # 1日の曜日に合わせて空白をあける

# 初日から最終日を表示
(first_day..last_day).each do |date|
  print date.day.to_s.rjust(2) + " "
  print "\n" if date.saturday?  # 土曜日の後で改行
end
