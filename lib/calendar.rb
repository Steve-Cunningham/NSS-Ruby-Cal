
class Month
  
  attr_accessor :month
  attr_accessor :year
  attr_reader :month_name, :num_days, :start_day, :weeks, :get_days_in_month
  MONTHS = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  def month_to_i(month)

    if MONTHS.include?(month)
        numeric_month = MONTHS.index(month) + 1
    elsif 0 < month.to_i && month.to_i < 12
        numeric_month = month
    end

    return numeric_month.to_i
  end

  def initialize(month, year)
    @year = year.to_i

    if month != Fixnum
      month = month_to_i(month)
      @month = month
    end

    if (@year < 1800 or @year > 3000)
      raise ArgumentError, "Year must be between 1800 and 3000"
    end

    @month_name = MONTHS[month - 1]
    @month_name = month_name
  end

  def leap_year?
    if year % 400 == 0
      true
    elsif year % 100 == 0
      false
    elsif year % 4 == 0
      true
    else
      false
    end
  end

  def month_header(month, year)
    if month.class != Fixnum && year.class != Fixnum
      return "#{month_name} #{Time.new.year}".center(20).rstrip + "\n"
    else 
      return "#{month_name} #{year}".center(20).rstrip + "\n"
    end
  end

  def day_header
    return "Su Mo Tu We Th Fr Sa\n"
  end

  def get_start_day(month, year)
    q = 0
    if @month < 3
        month += 12
        year = @year - 1
    end

    # Zeller's congruence (http://en.wikipedia.org/wiki/Zeller's_congruence)
    @start_day = (q + ((month + 1)*26  / 10).floor + year + (year / 4).floor + (6*(year / 100).floor) + (year / 400).floor) % 7
  end


  def compile_dates

    if leap_year? == true
    daysByMonth = [31,29,31,30,31,30,31,31,30,31,30,31]
    else
    daysByMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
    end
    @num_days = daysByMonth[@month - 1]
    
    chars = [" 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12", 
    "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", 
    "26", "27", "28", "29", "30", "31"]

    num_days = @num_days
    @weeks = []

    if num_days == 28
      chars = chars[0..27]
    elsif num_days == 29
      chars = chars[0..28]
    elsif num_days == 30
      chars = chars[0..29]
    end

    get_start_day(month,year)

    1.upto(@start_day) do 
        chars.unshift("  ") 
    end

    while chars.length > 0
        week = chars.take(7)
        chars = chars.drop(7)
        weeks_array_item = week.join(" ")
        if weeks_array_item.length < 20
          weeks_array_item = weeks_array_item + (" "*(20 - weeks_array_item.length))
        end
        @weeks.push(weeks_array_item)
    end
    until @weeks.length == 6
      @weeks.push("\n")
    end 
    @weeks

  end

  def print_month
    puts month_header(month, year)
    puts day_header
    compile_dates
    puts @weeks
    # puts "\n"
  end

end



