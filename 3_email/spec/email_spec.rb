require 'minitest/autorun'
require_relative '../lib/email.rb'

class EmailVerifierTest < Minitest::Test
  # 各テスト開始時に一度呼ばれる
  def setup
    @verifier = EmailVerifier.new
  end

  def test_email
    assert @verifier.execute('abc@example.com')
    assert !@verifier.execute('a..bc@example.com')
  end

end
