class ClubTeam < ActiveRecord::Base
  before_validation :update_slug
  scope :main_pages, where(:general_page != 1).where(:parent_id => nil).order("created_at DESC")
  scope :general_pages, where(:general_page => true).order("created_at DESC")

  validates_uniqueness_of :name, :scope => :parent_id

  def children
    ClubTeam.where(:parent_id => id).order("created_at DESC")
  end

  def parent
    ClubTeam.where(:id => parent_id).first
  end

  private 

  def update_slug
    self.slug = self.name.parameterize
  end
end

