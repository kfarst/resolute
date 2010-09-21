class Item < ActiveRecord::Base
  validates_uniqueness_of :title
  validates_presence_of :title
  scope :list_order, order("position ASC")

  CATEGORY_AS_LINK = ["Home", "Videos"]

  before_save :update_slug

  def to_param
    title.downcase.parameterize
  end

  private 

  def update_slug
    self.slug == self.title.downcase.parameterize
  end
end
