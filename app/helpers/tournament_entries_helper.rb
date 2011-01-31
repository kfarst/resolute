module TournamentEntriesHelper
  def divisions
    ["3/4",
    "5/6 A",
    "5/6 B"]
  end

  def waiver_agreed_to?
    unless params[:waiver] == 1
      errors.add_to_base("You must agree to the waiver.") and return false
    end
  end
end
