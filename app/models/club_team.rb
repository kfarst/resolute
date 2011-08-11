class ClubTeam < ActiveRecord::Base
  before_validation :update_slug
  scope :main_pages, where(:general_page ^ true).where(:parent_id => nil).order("created_at DESC")
  scope :general_pages, where(:general_page => true).order("created_at ASC")

  validates_uniqueness_of :name, :scope => :parent_id

  def children
    ClubTeam.where(:parent_id => id).order("created_at DESC")
  end

  def parent
    ClubTeam.where(:id => parent_id).first
  end

  def general_page?
    general_page == true
  end

  private 

  def update_slug
    self.slug = self.name.parameterize
  end
end

