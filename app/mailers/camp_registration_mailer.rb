class CampRegistrationMailer < ActionMailer::Base
  default :from => "Resolute Lacrosse"

  def registration_email(registration)
   @registration = registration
   mail(:to => @registration.email,  :subject => "Thank you for signing up for the #{@registration.registration_form.camp.name}!") do |format|
     format.html { render 'registration_email'  }
     format.text { render 'registration_email'  }
   end 
  end
end
