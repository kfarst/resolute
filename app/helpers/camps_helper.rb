module CampsHelper
  include CalendarHelper

  def formatted_datetime(datetime)
    return datetime.strftime("%B %e, %Y at %l:%M %p")
  end

  def city_and_state(camp)
    result = camp.get_address
    result[0].locality + ", " + result[0].administrative_area
  end

  def street_address(camp)
    result = camp.get_address
    raw(result[0].thoroughfare + "<br />" + city_and_state(camp) + " " + result[0].postal_code)
  end


  def found_resolute
    answers = []
    answers = ["Recommended", "Google Search", "Advertisement", "Other"].map{|answer| [answer, answer]}
  end

  def state_abbreviations
    states = []
    states = %w[AL AK AS AZ AR CA CO CT DE DC FM FL GA GU HI ID IL IN IA KS KY LA ME MH MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND MP OH OK OR PW PA PR RI SC SD TN TX UT VT VI VA WA WV WI WY].map{|state| [state, state]}
  end
end
