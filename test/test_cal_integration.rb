require 'test/unit'
require 'calendar'
require 'year'

class CalendarTest < Test::Unit::TestCase

  def test_01_calendar
    assert_equal(`cal 11 2013`,`ruby cal_exe.rb 11 2013`)
  end

  def test_02_leapyear
    assert_equal(`cal 2 2012`, `ruby cal_exe.rb 2 2012`)
  end

  def test_02a_leapyear_if_100
    assert_equal(`cal 2 1900`, `ruby cal_exe.rb 2 1900`)
  end

  def test_02b_leapyear_if_400
    assert_equal(`cal 2 2000`, `ruby cal_exe.rb 2 2000`)
  end 

  def test_03_four_week_month
    assert_equal(`cal 2 2015`, `ruby cal_exe.rb 2 2015` + "\n")
  end

  def test_03b_five_week_month
    assert_equal(`cal 2 2013`, `ruby cal_exe.rb 2 2013`)
  end

  def test_03c_six_week_month
    assert_equal(`cal 3 2013` + "\n", `ruby cal_exe.rb 3 2013`)
  end

  def test_04_year_only
    assert_equal(`cal 2013`, `ruby cal_exe.rb 2013`)
  end

  def test_05_error_message_month
    assert_equal(`cal 13 2013`, `ruby cal_exe.rb 2013`)
  end

  def test_05a_error_message_year
    assert_equal(`cal 10000`, `ruby cal_exe.rb 10000`)
  end

  def test_06_no_arguments
    assert_equal(`cal`, `ruby cal_exe.rb`)
  end




end