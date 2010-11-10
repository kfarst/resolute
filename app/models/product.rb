class Product < ActiveRecord::Base
  has_attached_file :picture, :styles => { :medium => "300x400", :thumb => "150x250" }
  validates_presence_of :name, :price
  validates_numericality_of :price
  validates_format_of :size, :with => /(?:^|,)(\\\"(?:[^\\\"]+|\\\"\\\")*\\\"|[^,]*)/
end
