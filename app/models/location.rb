class Location
  attr_accessor :getcode, :street_address, :city, :state, :zip

  def initalize(location)
    @geocode = Geocoding::get(location)
  end

  def get_address

  end
end
