#!/usr/bin/env ruby
number = 0
while number < 20
  number += 1
  if (number % 3 == 0) && (number % 5 == 0) # 3と5両方の倍数の場合
    puts "FizzBuzz"
  elsif number % 3 == 0 # 3の倍数の場合
    puts "Fizz"
  elsif number % 5 == 0 # 5の倍数の場合
    puts "Buzz"
  else # 上記以外の場合
    puts number
  end
end

