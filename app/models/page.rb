class Page < Item
  belongs_to :category
  validates_presence_of :title

  def to_param
    title.to_s.parameterize
  end
end
