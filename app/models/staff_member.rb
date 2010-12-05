class StaffMember < ActiveRecord::Base
  has_attached_file :profile_picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates_presence_of :name, :stats, :bio

  def get_stats
    stats.split(",")
  end
end
