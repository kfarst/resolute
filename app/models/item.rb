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
    if is_page?
      return update_attributes(params[:page])
    else
      return update_attributes(params[:category])
    end
  end

  def is_page?
    self.type == "Page"
  end

  private 

  def sanitize_title
    title.to_s.titleize
  end

  def update_slug
    self.slug = self.title.to_s.parameterize
  end
end
