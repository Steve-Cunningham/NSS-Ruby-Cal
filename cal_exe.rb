require 'lib/calendar.rb'

month = ARGV[0].to_i
year = ARGV[1].to_i

cal = Calendar.new(month,year)

cal.print_calendar