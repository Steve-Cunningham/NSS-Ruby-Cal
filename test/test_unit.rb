require './lib/calendar.rb'
require './lib/year.rb'

class CalendarTest < Test::Unit::TestCase

  def test_01_initialize_month
    calendar = Month.new(5, 2013)
    assert_equal(5, calendar.month)
  end

  def test_02_initialize_month_word
    calendar = Month.new("January", "2013")
    assert_equal(1, calendar.month)
  end

  def test_03_weeks_array
    calendar = Month.new(2, 2012)
    assert_equal([["  ", "  ", "  ", " 1", " 2", " 3", " 4"],
 [" 5", " 6", " 7", " 8", " 9", "10", "11"],
 ["12", "13", "14", "15", "16", "17", "18"],
 ["19", "20", "21", "22", "23", "24", "25"],
 ["26", "27", "28", "29", "30", "31"]], calendar.compile_dates)
  end


end