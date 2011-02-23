module ClubTeamsHelper
  def even?(index)
    index % 2 == 0
  end

  def confine_to_background(team_name)
    truncate(word_wrap(team_name, :line_width => 21), :length => 82)
  end

  def club_team_links(parent_page)
    output = ""
    output << "<ul>"
    if parent_page.children.empty?
      ClubTeam.find_by_id(parent_page.parent_id).children.each do |club_team|
        output << "<li><a href='#{club_team_path(club_team)}'>#{club_team.name}</a></li>"
        output << "<hr width = '100%' style = 'height: 1px; color: black;' />"
      end
    else
      parent_page.children.each do |club_team|
        output << "<li><a href='#{club_team_path(club_team)}'>#{club_team.name}</a></li>"
        output << "<hr width = '100%' style = 'height: 1px; color: black;' />"
      end
    end
    output << "</ul>"
    raw(output)
  end

  def all_club_teams
    ClubTeam.main_pages.collect { |team| [team.name, team.id] }
  end
end

