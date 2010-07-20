class ContactMailer < ActionMailer::Base
  default :from => "Resolute Lacrosse"

  def contact_email(message)
   @message = message
   @url = "http://example.com/login" 
   mail(:to => "resolutelacrosse@gmail.com",  :subject => "Welcome to My Awesome Site") do |format| 
     format.text { render 'contact_email'  } 
   end 
  end

  def response_email(message)
   @message = message
   @url = "http://example.com/login" 
   mail(:to => @message.email,  :subject => "Welcome to My Awesome Site") do |format| 
     format.html { render 'response_email'  } 
     format.text { render 'response_email'  } 
   end 
  end
end
