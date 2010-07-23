module ItemsHelper
  def item_form_options(item)
    options = {}
    options[:url] = polymorphic_path(item)
    options[:html] = {}
    options[:html][:method] = (item.new_record? ? :post : :put)
    options
  end
end
