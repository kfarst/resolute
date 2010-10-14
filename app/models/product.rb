class Product < ActiveRecord::Base
  has_attached_file :picture, :styles => { :medium => "400x300", :thumb => "100x100" }
  validates_presence_of :name, :url
end
