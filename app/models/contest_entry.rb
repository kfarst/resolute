class ContestEntry < ActiveRecord::Base
  validates_presence_of :name, :email, :age, :position, :school
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_uniqueness_of :email
  validates_length_of :age, :maximum => 2, :message => "may only be two digits (zero in front if less than 10)"
  validates_numericality_of :age

  def to_param
    id
  end
end
