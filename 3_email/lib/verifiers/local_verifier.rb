require_relative "./dot_atom_verifier.rb"
require_relative "./quated_string_verifier.rb"

class EmailLocalVerifier

def initialize
    @verifiers = [
    DotAtomVerifier.new,
    QuatedStringVerifier.new
    ]
end

def execute(local)
    @verifiers.any? {|verifier| verifier.execute(local) }
end
end
  