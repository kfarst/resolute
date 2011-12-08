class Product < ActiveRecord::Base
  if Rails.env.production?
    has_attached_file :picture,
                      :styles => { :medium => ["300x400#", :png], :thumb => ["150x250#", :png] },
                      :storage => :s3_authenticated_url,
                      :path => ":attachment/:id/:style.:extension",
                      :bucket => 'product_pics',
                      :s3_credentials => File.join(Rails.root, 'config', 's3.yml'),
                      :s3_permissions => 'private',
                      :s3_protocol => 'https'
  else
    has_attached_file :picture,
                      :styles => { :medium => ["300x400#", :png], :thumb => ["150x250#", :png] },
                      :storage => :filesystem
  end

  validates_presence_of :name, :price
  validates_numericality_of :price
  validates_format_of :size, :with => /(?:^|,)(\\\"(?:[^\\\"]+|\\\"\\\")*\\\"|[^,]*)/
end
