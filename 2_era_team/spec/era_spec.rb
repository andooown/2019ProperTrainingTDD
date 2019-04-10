require 'minitest/autorun'
require_relative '../lib/era.rb'

class EraTest < Minitest::Test
  # 各テスト開始時に一度呼ばれる
  def setup
    @era = Era.new
  end

  def test_era
    assert_equal '昭和2年', @era.calc(1927, 1, 1)
    assert_equal '平成8年', @era.calc(1996, 11, 7)
    assert_equal '平成31年', @era.calc(2019, 4, 30)
  end

  def test_era_gannen
    assert_equal '昭和元年', @era.calc(1926, 12, 25)
    assert_equal '平成元年', @era.calc(1989, 1, 8)
  end

  def test_error
    assert_raises ArgumentError do
      @era.calc(1926, 12, 24)
    end
  end

end
