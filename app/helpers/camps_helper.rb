module CampsHelper
  include CalendarHelper

  def formatted_datetime(datetime)
    return datetime.strftime("%B %e, %Y at %l:%M %p")
  end

  def city_and_state(camp)
    result = camp.location
    result.split(" ")[0]
  end

  def street_address(camp)
    result = camp.location
    result.split(" ")[1]
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
