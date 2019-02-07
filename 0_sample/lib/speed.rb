
class Speed
  def calc(distance, elapsed_time)
    raise ArgumentError if distance < 0 || elapsed_time <= 0
    
    distance.to_f / elapsed_time.to_f
  end
end