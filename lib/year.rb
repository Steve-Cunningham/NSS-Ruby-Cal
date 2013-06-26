require_relative 'calendar'

class Year

  attr_accessor :year, :month
  attr_reader :month_name, :num_days, :start_day, :week_header, :full_year
  # @MONTHS = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

def initialize(year)

    @week_header = "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa"
    @month_header = ["      January               February               March        ", 
                    "       April                  May                   June       ",
                    "        July                 August              September      ",
                    "      October               November              December      "]
    @year = year
end

def compile_year

    i = 1
    @full_year = []

    12.times do
        month_of_year = Month.new(i,year).compile_dates
        @full_year.push(month_of_year)
        i = i + 1
    end
end

def print_year
    compile_year
    puts "#{year}".center(64) + "\n\n"
    x = 0
    y = 0
    z = 0
    4.times do
      puts @month_header[z]
      puts @week_header
      y = 0
      6.times do 
        weekly_string = "#{full_year[x][y]}  #{full_year[x+1][y]}  #{full_year[x+2][y]}\n"
        puts weekly_string
        y = (y+1)
      end
      x = x + 3
      z = z + 1
    end
end




end