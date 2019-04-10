class EmailVerifier
  def initialize()
    @domain_verifier = EmailDomainVerifier.new
    @local_verifier = EmailLocalVerifier.new
  end

  def execute(email)
    splited = email.split('@')
    return false unless splited.size == 2

    domain, local = splited
    @domain_verifier.execute(domain) && @local_verifier.execute(local)
  end
end

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

class DotAtomVerifier

  def execute(local)
    [
      ld1(local),
      ld2(local),
      ld3(local),
      ld4(local),
      ld5(local)
    ].all?
  end

  def ld1(local)
    except = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!#$%&'*+-/=?^_`{|}~."
    
    local.chars.to_a.all? {|c| except.include?(c) }
  end

  def ld2(local)
    !local.start_with?('.')
  end

  def ld3(local)
    !local.end_with?('.')
  end

  def ld4(local)
    !local.include?('..')
  end

  def ld5(local)
    local.size >= 1
  end

end

class QuatedStringVerifier

  def execute(local)
    [
      lq1(local),
      lq2(local),
      lq3(local),
      # lq4(local),
      lq5(local)
    ].all?
  end

  def lq1(local)
    local.start_with?('"')
  end

  def lq2(local)
    local.end_with?('"')
  end

  def lq3(local)
    local = local[1..-1]

    except = %Q(abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!#$%&'*+-/=?^_`{|}~(),.:;<>@[]"\))
    local.chars.to_a.all? {|c| except.include?(c) }
  end

  def lq5(local)
    local.length >= 2
  end

end
