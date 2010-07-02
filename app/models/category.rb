class Category < Item
  has_many :pages

  def less_than_two_pages?
    self.pages.count < 2
  end

end
