require 'minitest/autorun'
require_relative '../../lib/email.rb'

class EmailLocalVerifierTest < Minitest::Test
  def setup
    @verifier = EmailLocalVerifier.new
  end

  def test_execute
    assert @verifier.execute('abc')
    assert !@verifier.execute('a..bc')
  end
end