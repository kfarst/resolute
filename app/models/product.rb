class Product < ActiveRecord::Base
  has_attached_file :picture, :styles => { :medium => "400x300", :thumb => "250x150" }
  validates_presence_of :name, :price
  validates_numericality_of :price
  validates_format_of :size, :with => /(?:^|,)(\\\"(?:[^\\\"]+|\\\"\\\")*\\\"|[^,]*)/
end
