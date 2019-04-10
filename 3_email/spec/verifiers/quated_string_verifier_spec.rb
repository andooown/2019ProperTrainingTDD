require 'minitest/autorun'
require_relative '../../lib/email.rb'

class QuatedStringVerifierTest < Minitest::Test
  def setup
    @verifier = QuatedStringVerifier.new
  end

  def test_lq1
    assert @verifier.lq1('"asdf')
    assert !@verifier.lq1('asdf')
  end

  def test_lq2
    assert @verifier.lq2('asdf"')
    assert !@verifier.lq2('asdf')
  end

  def test_lq3
    assert @verifier.lq3(%Q(0!#$%&'*+-/=?^_`{|}~(),.:;<>@[]"\)0))
    assert !@verifier.lq3('0あせんｆ0')
  end

  def test_lq5
    assert @verifier.lq5('faslqkfjaod')
    assert !@verifier.lq5('f')
  end
end