class Camp < ActiveRecord::Base
  #has_event_calendar
  validates_presence_of :name, :start_at, :end_at, :description, :location, :group, :cost
  validates_numericality_of :cost
  validates_uniqueness_of :name
  validates_format_of :location,
                      :with => /\d+.+(?=AL|AK|AS|AZ|AR|CA|CO|CT|DE|DC|FM|FL|GA|GU|HI|ID|IL|IN|IA|KS|KY|LA|ME|MH|MD|MA|MI|MN|MS|MO|MT|NE|NV|NH|NJ|NM|NY|NC|ND|MP|OH|OK|OR|PW|PA|PR|RI|SC|SD|TN|TX|UT|VT|VI|VA|WA|WV|WI|WY)[A-Z]{2}[, ]+\d{5}(?:-\d{4})?/,
                      :message => "must have a full address"

  has_many :camp_registrations, :through => :registration_form, :dependent => :destroy

  scope :high_school_camps, where(:group => "High School").order("start_at ASC")
  scope :junior_high_camps, where(:group => "Junior High").order("start_at ASC")
  scope :other_camps, where((:group ^ "High School") & (:group ^ "Junior High")).order("start_at ASC")

  def get_address
    Geocoding::get(location)
  end

  def get_map
    result = get_address
    MapImage::get(:street => result[0].thoroughfare,
                  :city => result[0].locality,
                  :state => result[0].administrative_area,
                  :zip => result[0].postal_code,
                  :image_type => "png").url
  end

  def to_param
    name.downcase.parameterize
  end

end
