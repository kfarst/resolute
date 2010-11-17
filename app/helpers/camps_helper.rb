module CampsHelper
  include CalendarHelper

  def formatted_datetime(datetime)
    datetime.strftime("%B %e, %Y at %l:%M %p")
  end

  def city_and_state(camp)
    result = camp.get_address
    result[0].locality + ", " + result[0].administrative_area
  end

  def street_address(camp)
    result = camp.get_address
    raw result[0].thoroughfare + "<br />" + city_and_state(camp) + " " + result[0].postal_code
  end
end
