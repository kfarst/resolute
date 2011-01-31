class Product < ActiveRecord::Base
  if Rails.env.production?
    has_attached_file :picture, 
                      :styles => { :medium => "300x400", :thumb => "150x250" },
                      :storage => :s3,
                      :s3_credentials => "#{Rails.root}/config/s3.yml",
                      :path => ":attachment/:id/:style.:extension",
                      :bucket => 'product_pics'
  else
    has_attached_file :picture, 
                      :styles => { :medium => "300x400#", :thumb => "150x250#" },
                      :path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension"
  end

  validates_presence_of :name, :price
  validates_numericality_of :price
  validates_format_of :size, :with => /(?:^|,)(\\\"(?:[^\\\"]+|\\\"\\\")*\\\"|[^,]*)/
end
