class TournamentEntry < ActiveRecord::Base
  validates_presence_of :team_name
  validates_presence_of :coach_name
  validates_presence_of :coach_phone
  validates_presence_of :coach_email
  validates_presence_of :director_name
  validates_presence_of :division
  validates_presence_of :street_address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip

  validates_format_of :coach_phone, :with => /^(\()?([0-9]{3})(\)|-|.\s)?([0-9]{3})(-)?([0-9]{4}|[0-9]{4})$/, :on => :create
  validates_format_of :coach_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_format_of :zip, :with => /^\d{5}([\-]\d{4})?$/
end
