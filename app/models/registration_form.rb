class RegistrationForm < ActiveRecord::Base
  belongs_to :camp
  has_many :camp_registrations
end
