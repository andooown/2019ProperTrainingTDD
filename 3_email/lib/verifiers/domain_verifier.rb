require 'minitest/autorun'

class EmailDomainVerifier
    def execute(domain)
      [
        d1(domain),
        d2(domain),
        d3(domain),
        d4(domain),
        d5(domain),
      ].all?
    end
  
    def d1(domain)
      except = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!#$%&'*+-/=?^_`{|}~."
      
      domain.chars.to_a.all? {|c| except.include?(c) }
    end
  
    def d2(domain)
      !domain.start_with?('.')
    end
  
    def d3(domain)
      !domain.end_with?('.')
    end
  
    def d4(domain)
      !domain.include?("..")
    end
  
    def d5(domain)
      domain.size >= 1
    end
  end
  