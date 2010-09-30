class Item < ActiveRecord::Base
  validates_uniqueness_of :title
  validates_presence_of :title
  scope :list_order, order("position ASC")

  CATEGORY_AS_LINK = ["Home", "Videos"]

  before_save :update_slug

  def to_param
    title.downcase.parameterize
  end

  def self.get_youtube_videos
    $youtube.videos_by(:author => "resolutelacrosse")
  end

  private 

  def update_slug
    slug = title.downcase.parameterize
  end
end
