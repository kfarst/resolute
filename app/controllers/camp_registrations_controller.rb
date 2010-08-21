class CampRegistrationsController < ApplicationController
  # GET /camp_registrations
  # GET /camp_registrations.xml
  before_filter :authenticate_user!, :except => [:new, :create]
  before_filter :find_registration, :only => [:show, :edit, :update, :destroy]

  def index
    @camp_registrations = CampRegistration.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @camp_registrations }
    end
  end

  # GET /camp_registrations/1
  # GET /camp_registrations/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @camp_registration }
    end
  end

  # GET /camp_registrations/new
  # GET /camp_registrations/new.xml
  def new
    @camp_registration = CampRegistration.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @camp_registration }
    end
  end

  # GET /camp_registrations/1/edit
  def edit
  end

  # POST /camp_registrations
  # POST /camp_registrations.xml
  def create
    @camp_registration = CampRegistration.new(params[:camp_registration])

    respond_to do |format|
      if @camp_registration.save
        format.html { redirect_to "https://www.paypal.com/us/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=UQUUEGQTEF5TC" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @camp_registration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /camp_registrations/1
  # PUT /camp_registrations/1.xml
  def update

    respond_to do |format|
      if @camp_registration.update_attributes(params[:camp_registration])
        format.html { redirect_to(@camp_registration, :notice => 'Camp registration was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @camp_registration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /camp_registrations/1
  # DELETE /camp_registrations/1.xml
  def destroy
    @camp_registration.destroy

    respond_to do |format|
      format.html { redirect_to(camp_registrations_url) }
      format.xml  { head :ok }
    end
  end

  private

  def find_registration
    @camp_registration = CampRegistration.find(params[:id])
  end
end
