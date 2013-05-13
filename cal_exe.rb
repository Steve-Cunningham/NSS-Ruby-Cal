require 'lib/calendar.rb'
require 'lib/year.rb'


if ARGV.length == 1
  if ARGV[0].length < 4
    raise ArgumentError, "Year must be between 1800 and 3000"
  else
    year = ARGV[0].to_i
    cal = Year.new(year)
    cal.print_year 
  end
elsif ARGV.length == 0
    raise ArgumentError, "Please specify a month and year"
else
  month = ARGV[0]
  year = ARGV[1].to_i
  cal = Month.new(month,year)
  cal.print_month
end



