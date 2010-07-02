module CategoriesHelper

  def link_or_dropdown (category)
    if category.pages.count == 1 
      link_to category.title, pretty_url_path(category.pages.first)
    elsif category.pages.count == 0
      link_to category.title, "/#{category.title.parameterize}"
    else
      "#{category.title}"
    end
  end
end
