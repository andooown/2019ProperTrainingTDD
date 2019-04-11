require 'minitest/autorun'
require_relative '../../lib/verifiers/local_verifier.rb'

class EmailLocalVerifierTest < Minitest::Test
  def setup
    @verifier = EmailLocalVerifier.new
  end

  def test_execute
    assert @verifier.execute('abc')
    assert !@verifier.execute('a..bc')
  end
end