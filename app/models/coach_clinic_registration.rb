class CoachClinicRegistration < ActiveRecord::Base
  validates_presence_of :name, :email, :program
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_uniqueness_of :email
end
