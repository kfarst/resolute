class ClubTeamRegistration < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :primary_email, :primary_phone, :school, :age, :graduation_year, :position

  validates_format_of :primary_phone, :secondary_phone, :with => /^(\()?([0-9]{3})(\)|-|.\s)?([0-9]{3})(-)?([0-9]{4}|[0-9]{4})$/, :on => :create
  validates_format_of :primary_email, :secondary_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  validates_numericality_of :age, :less_than => 100
end
