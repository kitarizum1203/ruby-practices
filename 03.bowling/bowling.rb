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

frames = []
shots.each_slice(2) do |s|
  frames << s
end

point = 0
frames.each_with_index do |frame, i|
  if i < 9
    if frame[0] == 10 # strike
      next_frame = frames[i + 1]
      if next_frame[0] == 10
        second_next_frame = frames[i + 2]
        point += frame[0] + next_frame[0] + second_next_frame[0]
      else
        point += frame[0] + next_frame.sum
      end
    elsif frame.sum == 10 # spare
      next_frame = frames[i + 1]
      point += frame.sum + next_frame[0]
    else # other
      point += frame.sum
    end
  else
    point += frame.sum
  end
end

p point
