class ClubTeamRegistration < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :primary_email, :primary_phone, :school, :age, 
                        :graduation_year, :position, :street_address, :city, :state, :zip

  validates_format_of :primary_phone, :with => /^(\()?([0-9]{3})(\)|-|.\s)?([0-9]{3})(-)?([0-9]{4}|[0-9]{4})$/, :on => :create
  validates_format_of :primary_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_format_of :zip, :with => /^\d{5}([\-]\d{4})?$/

  validates_numericality_of :age, :less_than => 100
end
