module ApplicationHelper
  def category_name_or_link(category)
    (only_whitespace?(category.body) && !Category::CATEGORY_AS_LINK.include?(category.title)) ? category.title : (link_to category.title, pretty_url_path(category))
  end

  def only_whitespace?(string) 
    string.to_s.strip.blank?
  end

  def google_analytics_js
    raw("<script type=\"text/javascript\">

      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-9964251-1']);
      _gaq.push(['_trackPageview']);

      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();

    </script>")
  end

   def link_to_add_fields(name, f, association)
     new_object = f.object.class.reflect_on_association(association).klass.new
     fields = ''
     f.fields_for(association, [new_object], :child_index => "new_#{association}") do |builder|
        fields = render(association.to_s.singularize + "_fields", :f => builder)
     end
     link_to_function(name, "add_fields(this, '#{association}', '#{escape_javascript(fields)}')")
   end



  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end 
end
