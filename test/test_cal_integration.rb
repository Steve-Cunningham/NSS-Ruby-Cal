require 'test/unit'
require 'calendar.rb'

class CalendarTest < Test::Unit::TestCase

  def test_01_cal
    assert_equal(`cal 4 2013`,`ruby calendar.rb 4 2013`)
  end

  def test_02_leapyear
    assert_equal(`cal 2 2012`, `ruby calendar.rb 2 2012`)
  end

  def test_02a_leapyear_if_100
    assert_equal(`cal 2 1900`, `ruby calendar.rb 2 1900`)
  end

  def test_02b_leapyear_if_400
    assert_equal(`cal 2 2000`, `ruby calendar.rb 2 2000`)
  end 

  def test_03_four_week_month
    assert_equal(`cal 2 2015`, `ruby calendar.rb 2 2015`)
  end

  def test_03b_five_week_month
    assert_equal(`cal 2 2013`, `ruby calendar.rb 2 2013`)
  end

  def test_03c_six_week_month
    assert_equal(`cal 3 2013`, `ruby calendar.rb 3 2013`)
  end

  def test_04_year_only
    assert_equal(`cal 2013`, `ruby calendar.rb 2013`)
  end

end