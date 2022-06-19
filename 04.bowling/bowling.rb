# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []
scores.each do |s|
  if s == 'X' && shots.size < 18
    shots << 10 << 0
  elsif s == 'X'
    shots << 10
  else
    shots << s.to_i
  end
end

frames = []
shots.each_slice(2) do |s|
  frames << s
end

if frames[10]
  a = frames[9]
  b = frames[10]
  a.concat(b)
  frames.delete(b)
end

point = 0
frames.each_with_index do |frame, i|
  point += if frames[i][0] == 10 && frames[i][1] == 10 && frames[i][2] == 10 && i == 9
             30
           elsif frames[i][0] == 10 && i == 9
             10 + frames[i][1] + frames[i][2]
           elsif frames[i][0] == 10 && i == 8
             10 + frames[i + 1][0] + frames[i + 1][1]
           elsif frames[i][0] == 10 && frames[i + 1][0] == 10 && frames[i + 2][0] == 10 && i < 8
             30
           elsif frames[i][0] == 10 && frames[i + 1][0] == 10 && i < 8
             20 + frames[i + 2][0]
           elsif frames[i][0] == 10 && i < 9
             10 + frames[i + 1][0] + frames[i + 1][1]
           elsif frames[i].sum == 10 && i < 9
             frames[i].sum + frames[i + 1][0]
           else
             frame.sum
           end
end
puts point
