class Category < Item
  validates_presence_of :title
  has_many :pages, :dependent => :destroy

  scope :visible, lambda {|id| where('category_id = ? and visible = ?', id, true) }
  scope :pages, joins(:pages)
end
