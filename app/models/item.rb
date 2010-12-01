class Item < ActiveRecord::Base
  validates_uniqueness_of :title
  validates_presence_of :title

  before_validation :sanitize_title
  after_validation :update_slug

  scope :list_order, order("position ASC")

  CATEGORY_AS_LINK = ["Home", "Videos"]

  def self.get_youtube_videos
    $youtube.videos_by(:author => "resolutelacrosse")
  end

  def to_param
    title.downcase.parameterize
  end

  def update_by_type(params)
    if self.type == "Page"
      update_attributes(params[:page])
    else
      update_attributes(params[:category])
    end
  end

  private 

  def sanitize_title
    title.titleize
  end

  def update_slug
    slug = title.to_s.parameterize
  end
end
