require 'date'

class Era
  @@eras = {
    "平成" => Time.new(1989, 1, 8)...Time.new(2019, 5, 1),
    "昭和" => Time.new(1926, 12, 25)...Time.new(1989, 1, 8),
  }

  class OutOfRangeError < StandardError; end

  # 元号変換ロジック
  #
  # @param year [Integer] 西暦
  # @param month [Integer] 月(1〜12)
  # @param day [Integer] 日(1〜31)
  # @return [String] 元号変換後の文字列 ex) "平成10年"
  def calc(year, month, day)
    date = Time.new(year, month, day)

    era = @@eras.find {|era_name, era| era.include? date} or raise OutOfRangeError

    year = year - era[1].first.year + 1
    "#{era[0]}#{year == 1 ? '元' : year}年"
  end
end

module EraParser
  module_function

  def excute(line)
    date = Date.strptime(line, '%Y/%m/%d')
    year, month, day = date.year, date.month, date.day
  
    era = Era.new
    era.calc(year, month, day)
  rescue => e
    'error'
  end
  
  def main(inputio, outputio)
    while line = inputio.gets
      outputio.puts(excute(line))
    end
  end
end
