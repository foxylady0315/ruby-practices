require "optparse"
require "date"

today = Date.today
@year = today.year
@month = today.month

def calendar(year: @year, month: @month)
  firstDay_of_month = Date.new(year, month, 1)
  lastDay_of_month = Date.new(year, month, -1)

  firstDay_of_month = firstDay_of_month.wday
  lastDay_of_month = lastDay_of_month.day

  puts calendar_title = Date.new(year, month).strftime("%b, %Y").center(20) 
  weeks = %w[日 月 火 水 木 金 土]
  puts weeks.join(" ")

  space_of_firstday = "   " * firstDay_of_month
  print space_of_firstday

  (1..lastDay_of_month).each do |d|
    print d.to_s.rjust(2) + " "
    firstDay_of_month = firstDay_of_month + 1
    if (firstDay_of_month % 7 == 0)
      print("\n")
    end
  end
end

def command_select_options
  opts = OptionParser.new


  select_options = {}
  
  opts.on('-y VAL') {|v| select_options[:year] = v.to_i}
  opts.on('-m VAL') {|v| select_options[:month] = v.to_i}

  opts.parse!
  select_options
end

calendar(**command_select_options)