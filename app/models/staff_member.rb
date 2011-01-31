class StaffMember < ActiveRecord::Base
  if Rails.env.production?
    has_attached_file :profile_picture, 
                      :styles => { :medium => "300x280#" },
                      :storage => :s3,
                      :s3_credentials => "#{Rails.root}/config/s3.yml",
                      :path => ":attachment/:id/:style.:extension",
                      :bucket => 'staff_member_pics'
  else
    has_attached_file :profile_picture, 
                      :styles => { :medium => "300x280#" },
                      :path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension"
  end

  has_many :stats, :dependent => :destroy
  accepts_nested_attributes_for :stats, :reject_if => lambda { |a| a[:content].blank? }

  validates_presence_of :name, :bio
  scope :list_order, order("position ASC")
end
