require 'minitest/autorun'
require_relative '../lib/email.rb'

class EmailVerifierTest < Minitest::Test
  # 各テスト開始時に一度呼ばれる
  def setup
    @verifier = EmailVerifier.new
  end

  def test_email
    # assert @verifier.execute('abc@example.com')
    # assert !@verifier.execute('a..bc@example.com')

    # LD5
    # assert !@verifier.execute('@example.com')
  end

end

class DotAtomVerifierTest < Minitest::Test

  def setup
    @verifier = DotAtomVerifier.new
  end

  def test_ld1
    assert @verifier.ld1("fodFJODN5345!#$%&'*+-/=?^_`{|}~.")
    assert !@verifier.ld1('ふぁｄｆひｄｆはｓｆ')
  end

  def test_ld2
    assert @verifier.ld2('fasldkfjaod')
    assert !@verifier.ld2('.fsdfa')
  end

  def test_ld3
    assert @verifier.ld3('fasldkfjaod')
    assert !@verifier.ld3('fsdfa.')
  end

  def test_ld4
    assert @verifier.ld4('fasldkfjaod')
    assert !@verifier.ld4('a..bc')
  end

  def test_ld5
    assert @verifier.ld5('fasldkfjaod')
    assert !@verifier.ld5('')
  end

end

