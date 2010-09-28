class ContestEntry < ActiveRecord::Base
  validates_presence_of :name, :email, :age, :position, :school
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_uniqueness_of :email
  validates_numericality_of :age, :less_than => 100

  def to_param
    id
  end
end
