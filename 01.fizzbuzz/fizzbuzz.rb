fizzbuzz = 0
while fizzbuzz < 20
  fizzbuzz += 1
  case
  when fizzbuzz % 3 == 0 && fizzbuzz % 5 == 0 # 3と5両方の倍数の場合
    puts "FizzBuzz"
  when fizzbuzz % 3 == 0 # 3の倍数の場合
    puts "Fizz"
  when fizzbuzz % 5 == 0 # 5の倍数の場合
    puts "Bizz"
  else # 上記以外の場合
    puts fizzbuzz
  end
end
