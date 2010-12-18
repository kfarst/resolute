class StaffMember < ActiveRecord::Base
  has_attached_file :profile_picture, 
                    :styles => { :medium => "300x300>" },
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => ":attachment/:id/:style.:extension",
                    :bucket => 'staff_member_pics'

  has_many :stats, :dependent => :destroy
  accepts_nested_attributes_for :stats, :reject_if => lambda { |a| a[:content].blank? }

  validates_presence_of :name, :bio
end
