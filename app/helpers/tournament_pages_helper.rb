module TournamentPagesHelper
  def navlinks
    output = ""
    output << "<ul>"
    TournamentPage.list_order.each do |tournament_page|
      output << "<li><a href='#{tournament_page_path(tournament_page)}'>#{tournament_page.title}</a></li>"
      output << "<hr width = '100%' style = 'height: 1px; color: black;' />"
    end
      output << "<li><a href='#{registration_tournament_pages_path}'>Register Now</a></li></ul>"
      raw(output)
  end
end
