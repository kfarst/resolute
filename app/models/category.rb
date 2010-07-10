class Category < Item
  has_many :pages, :dependent => :destroy

  def to_param
    title.to_s.parameterize
  end

  def less_than_two_pages?
    self.pages.count < 2
  end

end
