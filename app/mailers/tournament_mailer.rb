class TournamentMailer < ActionMailer::Base
  default :from => "Resolute Lacrosse"

  def response_email(tournament_entry)
   @tournament_entry = tournament_entry
   @url = "http://resolutelacrosse.com"
   mail(:to => @tournament_entry.coach_email,  :subject => "Thank you for registering your team for the tournament!") do |format|
     format.html { render 'response_email'  } 
     format.text { render 'response_email'  } 
   end 
  end
end
