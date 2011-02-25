module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
      when /edit page for that club team/
        raise 'no club team' unless @club_team
        edit_club_team_path(@club_team)
      when /page for that club team/
        raise 'no club team' unless @club_team
        club_team_path(@club_team)
      when /edit page for the (\d+)(?:st|nd|rd|th) club team/
        raise 'no club teams' unless @club_teams
        nth_club_team = @club_teams[$1.to_i - 1]
        edit_club_team_path(nth_club_team)
      when /page for the (\d+)(?:st|nd|rd|th) club team/
        raise 'no club teams' unless @club_teams
        nth_club_team = @club_teams[$1.to_i - 1]
        club_team_path(nth_club_team)


    when /the Test Category page/
      "/items/test-category"

    when /the Test Page page/
      "/items/test-page"

    when /the camp registration admin page/
      "/camp_registration"

    when /the Contact Us page/
      "/contact-us"

    when /the contest page/
      "/contest_entries/new"

    when /the product management admin page/
      "/products"

    when /the store page/
      "/store"

    when /the staff member admin page/
      "/staff_members/admin"

    when /the tournament entry admin page/
      "/tournament_entries"

    when /the panels admin page/
      "/panels/admin"

    when /the admin page/
      "/admin"

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
