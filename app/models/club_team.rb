class ClubTeam < ActiveRecord::Base
  before_save :update_slug
  scope :main_pages, where(:parent_id => nil).order("created_at DESC")

  def children
    ClubTeam.where(:parent_id => self.id).order("created_at DESC")
  end

  def to_param
    self.name.parameterize
  end

  private 

  def update_slug
    self.slug = self.name.parameterize
  end
end

