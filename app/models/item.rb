class Item < ActiveRecord::Base
  validates_uniqueness_of :title
  validates_presence_of :title

  def to_param
    title.to_s.downcase.gsub(" ", "-")
  end
end
