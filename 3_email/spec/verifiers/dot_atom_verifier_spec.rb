require 'minitest/autorun'

require 'minitest/autorun'
require_relative '../../lib/verifiers/dot_atom_verifier.rb'

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
