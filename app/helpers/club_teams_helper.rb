module ClubTeamsHelper
  def even?(index)
    index % 2 == 0
  end

  def confine_to_background(team_name)
    truncate(word_wrap(team_name, :line_width => 21), :length => 82)
  end

  def club_team_links(page)
    output = ""
    output << "<ul>"
    if page.is_a?(ActiveRecord::Relation)
      page.each do |club_team|
        output << "<hr width = '100%' style = 'height: 1px; color: black;' />"
        output << "<li><a href=\"/club_teams/#{club_team.slug}\">#{club_team.name}</a></li>"
      end
    else
      if page.parent_id.nil?
        output << "<li><a href=\"/club_teams/#{page.slug}\">#{page.name}</a></li>"

        page.children.each do |club_team|
          output << "<hr width = '100%' style = 'height: 1px; color: black;' />"
          output << "<li><a href=\"/club_teams/#{club_team.parent.slug}/#{club_team.slug}\">#{club_team.name}</a></li>"
        end unless page.children.empty?
      else
        output << "<li><a href=\"/club_teams/#{page.parent.slug}\">#{page.parent.name}</a></li>"

        page.parent.children.each do |club_team|
          output << "<hr width = '100%' style = 'height: 1px; color: black;' />"
          output << "<li><a href=\"/club_teams/#{club_team.parent.slug}/#{club_team.slug}\">#{club_team.name}</a></li>"
        end unless page.parent.nil? || page.parent.children.nil?
      end
    end

    output << "</ul>"
    raw(output.html_safe)
  end

  def all_club_teams
    ClubTeam.main_pages.collect { |team| [team.name, team.id] }
  end

  def club_team_title
    return @club_team.parent.name unless @club_team.parent.nil?
    @club_team.name
  end

  def is_a_general_page?
    params[:general_page] || @club_team.general_page
  end

  def positions
    ["Attack", "Middle", "Defense", "Goalie"]
  end

  def grad_year
    [2013, 2014, 2015, 2016, 2017]
  end

  def state_abbreviations
    states = []
    states = %w[AL AK AS AZ AR CA CO CT DE DC FM FL GA GU HI ID IL IN IA KS KY LA ME MH MD MA
                MI MN MS MO MT NE NV NH NJ NM NY NC ND MP OH OK OR PW PA PR RI SC SD TN TX UT
                VT VI VA WA WV WI WY].map{|state| [state, state]}
  end
end

