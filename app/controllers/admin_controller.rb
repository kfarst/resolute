class AdminController < ApplicationController
  layout 'application'
  # GET /admins
  # GET /admins.xml
  before_filter :authenticate_user!

  def index
  end

end
