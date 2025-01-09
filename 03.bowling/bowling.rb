#!/usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []
scores.each do |s|
  if s == 'X'
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end

frames = shots.each_slice(2).to_a

point = 0
frames.each_with_index do |frame, i|
  point += frame.sum
  next if frame.sum < 10 || i >= 9

  next_frame = frames[i + 1]
  second_next_frame = frames[i + 2]

  point += next_frame[0]
  next if frame[0] != 10

  point +=
    if next_frame[0] == 10
      second_next_frame[0]
    else
      next_frame[1]
    end
end

p point
