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
      local = local[1..-1] or return false
  
      except = %Q(abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!#$%&'*+-/=?^_`{|}~(),.:;<>@[]"\))
      local.chars.to_a.all? {|c| except.include?(c) }
    end
  
    def lq5(local)
      local.length >= 2
    end
  
  end