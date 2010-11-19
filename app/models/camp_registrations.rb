class CampRegistrations < ActiveRecord::Base
  validates_presence_of :name, :if => 
  validates_presence_of :email, :if => 
  validates_presence_of :age, :if => 
  validates_presence_of :position, :if => 
  validates_presence_of :school, :if => 
  validates_presence_of :phone, :if => 
  validates_presence_of :street_address, :if => 
  validates_presence_of :city, :if => 
  validates_presence_of :state, :if => 
  validates_presence_of :zip, :if => 
  validates_presence_of :grade, :if => 
  validates_presence_of :yrs_of_exp, :if => 
  validates_presence_of :finding_resolute, :if =>

  validates_format_of :phone, :with => /^(\()?([0-9]{3})(\)|-|.\s)?([0-9]{3})(-)?([0-9]{4}|[0-9]{4})$/, :on => :create, :if =>
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create, :if =>
  validates_format_of :zip, :with => /^\d{5}([\-]\d{4})?$/, :if =>

  validates_numericality_of :age, :less_than => 100, :if => 
  validates_numericality_of :grade, :less_than => 13, :greater_than => 0, :if =>
  validates_numericality_of :yrs_of_exp, :if =>

  has_one :camp, :through => :registration_forms

  def to_param
    id
  end
end
