class Camp < ActiveRecord::Base
  has_event_calendar
  acts_as_gmappable :check_process => :prevent_geocoding,
                    :address => lambda{|a| a.location },
                    :msg => "Sorry, not even Google could figure out where that is"

  validates_presence_of :name, :start_at, :end_at, :description, :location, :group, :cost, :payment_url
  validates_numericality_of :cost
  validates_uniqueness_of :name
  validates_format_of :payment_url, :with => /^(https:\/\/www.paypal.com\/)(.+)$/, :message => "must start with 'https://www.paypal.com/'"
  
  before_save :update_slug

  has_one :registration_form
  has_many :camp_registrations, :through => :registration_form, :dependent => :destroy

  accepts_nested_attributes_for :registration_form

  scope :high_school_camps, where{ (group == "High School") & (end_at > Time.now) }.order("start_at ASC")
  scope :junior_high_camps, where{ (group == "Junior High") & (end_at > Time.now) }.order("start_at ASC")
  scope :other_camps, where{ (group ^ "High School") & (group ^ "Junior High") & (end_at > Time.now) }.order("start_at ASC")

  def prevent_geocoding
    location.blank?
  end

  def to_param
    name.parameterize
  end

  private

  def update_slug
    self.slug = self.name.parameterize
  end

end
