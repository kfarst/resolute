class AdminController < ApplicationController
  layout 'application'
  # GET /admins
  # GET /admins.xml
  before_filter :authenticate_user!, :except => [:show]

  def index
  end

end
