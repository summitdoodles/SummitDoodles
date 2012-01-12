module ApplicationHelper

  # Return a title on a per-page basis.
  def pageTitle
    base_title = "SummitDoodle Admin"
    if @pageTitle.nil?
      base_title
    else
      "#{base_title} | #{@pageTitle}"
    end
  end

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

  def format_age(age_sec)

    h_age_parts =  age_parts(age_sec)

    msg = ""
    msg = pluralize( h_age_parts[:years], " year ", " years " ) if !h_age_parts[:years].eql?(0)
    msg += pluralize(h_age_parts[:months], " month "," months ") if !h_age_parts[:months].eql?(0)
    msg += pluralize(h_age_parts[:days], " day ", " days ") if !h_age_parts[:days].eql?(0)

    return msg

  end

  def format_weight(lb, oz)
    msg=""
    msg += lb.to_s + " lb " if !lb.blank? and (lb>0)
    msg += oz.to_s + " oz " if !oz.blank? and !oz.eql?(0)
    return msg
  end

end

