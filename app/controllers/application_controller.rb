class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  before_filter :authenticate
  USER_ID, PASSWORD = "resolute", "buckeyes44"
  

private
   def authenticate
      if Rails.env == "production"
        authenticate_or_request_with_http_basic do |id, password| 
            id == USER_ID && password == PASSWORD
        end
      end
   end
end
