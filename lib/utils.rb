module Utils

  # returns a hash of each of the parts
  # parts['years'], parts['months'], ect
  def age_parts(in_seconds)

   parts = Hash.new
   factors = [[:years, 31557600],
              [:months, 2629800],
              [:days,86400],
              [:hours, 3600],
              [:minutes,60],
              [:seconds,1]]
   factors.collect do |unit, factor|
     value, in_seconds = in_seconds.divmod(factor)
     parts[unit] = value
   end

   return parts
  end



end