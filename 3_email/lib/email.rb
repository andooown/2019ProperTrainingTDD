class EmailVerifier

  def execute(email)
    splited = email.split('@')
    if splited.size == 2
      raise ArgumentError
    end
    domain, local = splited
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
    @verifiers.any {|verifier| verifier.execute(local) }
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
    false
  end

end
