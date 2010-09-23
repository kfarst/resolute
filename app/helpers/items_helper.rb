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
end
