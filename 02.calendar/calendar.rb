require 'optparse'
require 'date'

today = Date.today
@year = today.year
@month = today.month

def calendar(year: @year, month: @month)
  first_day_of_month = Date.new(year, month, 1)
  last_day_of_month = Date.new(year, month, -1)

  first_day = first_day_of_month.wday
  last_day = last_day_of_month.day

  puts calendar_title = Date.new(year, month).strftime("%b, %Y").center(20)
  weeks = %w[日 月 火 水 木 金 土]
  puts weeks.join(" ")

  space_of_firstday = '   ' * first_day
  print space_of_firstday

  (1..last_day).each do |d|
    print d.to_s.rjust(2) + " "
    print("\n") if (first_day + d) % 7 == 0
  end
end

def command_select_options
  opts = OptionParser.new

  select_options = {}

  opts.on('-y VAL') { |v| select_options[:year] = v.to_i }
  opts.on('-m VAL') { |v| select_options[:month] = v.to_i }

  opts.parse!
  select_options
end

calendar(**command_select_options)
