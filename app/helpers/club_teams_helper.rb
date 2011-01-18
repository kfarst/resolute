module ClubTeamsHelper
  def even?(index)
    index % 2 == 0
  end

  def confine_to_background(team_name)
    truncate(word_wrap(team_name, :line_width => 21), :length => 82)
  end
end

