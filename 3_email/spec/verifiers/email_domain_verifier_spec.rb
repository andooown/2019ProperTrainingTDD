require 'minitest/autorun'

require 'minitest/autorun'
require_relative '../../lib/verifiers/domain_verifier.rb'

class EmailDomainVerifierTest < Minitest::Test
  def setup
    @verifier = EmailDomainVerifier.new
  end

  def test_execute
    assert @verifier.execute('abc')
    assert !@verifier.execute('a..bc')
  end

  def test_d1
    assert @verifier.d1('asdf')
    assert !@verifier.d1('aさであせんｆsdf')
  end

  def test_d2
    assert @verifier.d2('asdf')
    assert !@verifier.d2('.asdf')
  end

  def test_d3
    assert @verifier.d3('asdf')
    assert !@verifier.d3('asdf.')
  end

  def test_d4
    assert @verifier.d4('fasdkfjaod')
    assert !@verifier.d4('fasdkfj..aod')
  end

  def test_d5
    assert @verifier.d5('fasdkfjaod')
    assert !@verifier.d5('')
  end
end