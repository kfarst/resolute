class Category < Item
  validates_presence_of :title
  has_many :pages, :dependent => :destroy
end
