class ContactsController < ApplicationController
 layout 'application'

 def new  
   @message = Contacts.new  
 end  
 
 def create  
   @message = Contacts.new(params[:contact])  
   if @message.valid?
     ContactMailer.contact_email(@message).deliver
     ContactMailer.response_email(@message).deliver
     # TODO send message here  
     flash[:notice] = "Message sent! Thank you for contacting us."  
     redirect_to new_contact_path
   else  
     render :action => 'new'  
   end  
 end  
end
