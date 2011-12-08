class StaffMember < ActiveRecord::Base
  if Rails.env.production?
    has_attached_file :profile_picture,
                      :styles => { :medium => "300x280#" },
                      :storage => :s3_authenticated_url,
                      :path => ":attachment/:id/:style.:extension",
                      :bucket => 'staff_member_pics',
                      :s3_credentials => File.join(Rails.root, 'config', 's3.yml'),
                      :s3_permissions => 'private',
                      :s3_protocol => 'https'
  else
    has_attached_file :profile_picture,
                      :styles => { :medium => ["300x280#", :png] },
                      :storage => :filesystem
  end

  has_many :stats, :dependent => :destroy
  accepts_nested_attributes_for :stats, :reject_if => lambda { |a| a[:content].blank? }

  validates_presence_of :name, :bio
  scope :list_order, order("position ASC")
end
