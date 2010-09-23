class ResoluteTeamSignUp < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email, :age, :position, :school
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_uniqueness_of :email
  validates_numericality_of :age

  def to_param
    id
  end
end
