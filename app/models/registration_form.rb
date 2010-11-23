class RegistrationForm < ActiveRecord::Base
  belongs_to :camp
  belongs_to :camp_registrations
end
