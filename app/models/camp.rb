class Camp < ActiveRecord::Base
  has_event_calendar
  validates_presence_of :name, :start_at, :end_at, :description, :location, :group, :cost, :payment_url
  validates_numericality_of :cost
  validates_uniqueness_of :name
  validates_format_of :payment_url, :with => /^(https:\/\/www.paypal.com\/)(.+)$/, :message => "must start with 'https://www.paypal.com/'"
  
  before_save :update_slug

  # validates_format_of :location,
  #                     :with => /\\\\\\\\\\\\\\\\d+.+(?=AL|AK|AS|AZ|AR|CA|CO|CT|DE|DC|FM|FL|GA|GU|HI|ID|IL|IN|IA|KS|KY|LA|ME|MH|MD|MA|MI|MN|MS|MO|MT|NE|NV|NH|NJ|NM|NY|NC|ND|MP|OH|OK|OR|PW|PA|PR|RI|SC|SD|TN|TX|UT|VT|VI|VA|WA|WV|WI|WY)[A-Z]{2}[, ]+\\\\\\\\\\\\\\\\d{5}(?:-\\\\\\\\\\\\\\\\d{4})?/,
  #                     :message => "must have a full address"

  has_one :registration_form
  has_many :camp_registrations, :through => :registration_form, :dependent => :destroy

  accepts_nested_attributes_for :registration_form

  scope :high_school_camps, where(({:group => "High School"}) & (:end_at > Time.now)).order("start_at ASC")
  scope :junior_high_camps, where(({:group => "Junior High"}) & (:end_at > Time.now)).order("start_at ASC")
  scope :other_camps, where((:group ^ "High School") & (:group ^ "Junior High") & (:end_at > Time.now)).order("start_at ASC")

  def get_address
    Geocoding::get(location)
  end

  def to_param
    name.parameterize
  end

  private

  def update_slug
    self.slug = self.name.parameterize
  end

end
