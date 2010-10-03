class CampRegistrations < ActiveRecord::Base
  validates_presence_of :name, :email, :age, :position, :school, :phone
  validates_format_of :phone, :with => /^(\()?([0-9]{3})(\)|-|.\s)?([0-9]{3})(-)?([0-9]{4}|[0-9]{4})$/, :on => :create
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_uniqueness_of :email
  validates_numericality_of :age, :less_than => 100

  def to_param
    id
  end
end
