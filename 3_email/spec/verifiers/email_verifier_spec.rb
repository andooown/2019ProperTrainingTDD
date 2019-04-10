require 'minitest/autorun'

require_relative '../../lib/verifiers/email_verifier.rb'

class EmailVerifierTest < Minitest::Test
  # 各テスト開始時に一度呼ばれる
  def setup
    @verifier = EmailVerifier.new
  end

  def test_email
    # p @verifier.execute('abc@example.com')
    assert @verifier.execute('abc@example.com')
    assert !@verifier.execute('a..bc@example.com')

    # LD5
    assert !@verifier.execute('@example.com')
    assert !@verifier.execute('asdf@ex@ample.com')
  end

end

