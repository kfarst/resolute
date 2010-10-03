module ItemsHelper
  def item_form_options(item)
    options = {}
    options[:url] = polymorphic_path(item)
    options[:html] = {}
    options[:html][:method] = (item.new_record? ? :post : :put)
    options
  end

  def is_elite_teams_page?(item)
    item.slug == "elite-teams"
  end

  def get_type_from_position(position)
    request.fullpath.split("/")[position]
  end

  def item_type(item)
    if item.type == "Category"
      "category"
    elsif item.type == "Page"
      "page"
    else
      "item"
    end
  end
end
