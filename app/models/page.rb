class Page < Item
  belongs_to :category
  validates_presence_of :title
  validates_presence_of :category_id, :message => "You must select a category for the page to be in."
end
