module ItemsHelper
  def item_form_options(item)
    options = {}
    options[:url] = polymorphic_path(item)
    options[:html] = {}
    options[:html][:method] = (item.new_record? ? :post : :put)
    options
  end

  def get_type_from_position(position, path = request.fullpath)
    path.split("/")[position]
  end

  def is_page?(type)
    type == "Page"
  end

  def item_type_for_form_hash(item)
    if item.type == "Category"
      "category"
    elsif item.type == "Page"
      "page"
    else
      "item"
    end
  end
end
