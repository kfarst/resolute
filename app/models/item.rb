class Item < ActiveRecord::Base
  validates_uniqueness_of :title
  validates_presence_of :title
  after_save :update_slug

  scope :list_order, order("position ASC")

  CATEGORY_AS_LINK = ["Home", "Videos"]

  def self.get_youtube_videos
    $youtube.videos_by(:author => "resolutelacrosse")
  end

  def to_param
    title.downcase.parameterize
  end

  private 

  def update_slug
    update_attribute(:slug, title.parameterize)
  end
end
