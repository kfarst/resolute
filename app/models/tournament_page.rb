class TournamentPage < ActiveRecord::Base
  scope :list_order, order("position ASC")

  validates_uniqueness_of :title
  validates_presence_of :title, :body
  after_validation :update_slug

  def to_param
    title.to_s.parameterize
  end

  private

  def update_slug
    self.slug = self.title.to_s.parameterize
  end
end
