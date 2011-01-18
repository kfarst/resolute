class ClubTeam < ActiveRecord::Base
  before_save :update_slug

  def to_param
    self.name.parameterize
  end

  private 

  def update_slug
    self.slug = self.name.parameterize
  end
end

