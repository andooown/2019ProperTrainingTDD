require 'minitest/autorun'

require_relative "./domain_verifier.rb"
require_relative "./local_verifier.rb"

class EmailVerifier
    def initialize()
      @domain_verifier = EmailDomainVerifier.new
      @local_verifier = EmailLocalVerifier.new
    end
  
    def execute(email)
      splited = email.split('@')
      return false unless splited.size == 2
  
      local, domain = splited
      @domain_verifier.execute(domain) && @local_verifier.execute(local)
    end
  end
  