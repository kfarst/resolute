class StaffMember < ActiveRecord::Base
  if Rails.env.production?
    has_attached_file :profile_picture, 
                      :styles => { :medium => "300x300>", :thumb => "100x100>" },
                      :storage => :s3,
                      :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                      :path => ":attachment/:id/:style.:extension",
                      :bucket => 'staff_member_pics'
  else
    has_attached_file :profile_picture, 
                      :styles => { :medium => "300x300>", :thumb => "100x100>" }
  end


  validates_presence_of :name, :stats, :bio

  def stats_array
    return [] if stats.blank?
    stats.split(",")
  end

  def stats_csv
    stats.to_csv
  end
end
