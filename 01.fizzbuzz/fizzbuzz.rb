#!/usr/bin/env ruby
number = 0
while number < 20
  binding.break
  number += 1
  if (number % 3 == 0) && (number % 5 == 0)
    puts "FizzBuzz"
  elsif number % 3 == 0
    puts "Fizz"
  elsif number % 5 == 0 
    puts "Buzz"
  else
    puts number
  end
end
