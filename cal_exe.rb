require_relative 'lib/calendar'
require_relative 'lib/year'


if ARGV.length == 1
    year = ARGV[0].to_i
    cal = Year.new(year)
    cal.print_year 
elsif ARGV.length == 0
    raise ArgumentError, "Please specify a month and year"
else
  month = ARGV[0]
  year = ARGV[1].to_i
  cal = Month.new(month,year)
  cal.print_month
end



