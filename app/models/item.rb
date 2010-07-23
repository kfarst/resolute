class Item < ActiveRecord::Base
  validates_uniqueness_of :title
  validates_presence_of :title
  scope :list_order, order("position ASC")

  def to_param
    title.to_s.downcase.gsub(" ", "-")
  end
end
