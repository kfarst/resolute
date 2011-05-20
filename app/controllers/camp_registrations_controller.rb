class CampRegistrationsController < ApplicationController
  # GET /camp_registration
  # GET /camp_registration.xml
  before_filter :authenticate_user!, :except => [:new, :create]
  before_filter :find_registration, :only => [:show, :edit, :update, :destroy]

  def index
    @camp_registrations = CampRegistration.all
  end

  # GET /camp_registration/1
  # GET /camp_registration/1.xml
  def show
  end

  # GET /camp_registration/new
  # GET /camp_registration/new.xml
  def new
    @camp_registration = CampRegistration.new
  end

  # GET /camp_registration/1/edit
  def edit
  end

  # POST /camp_registration
  # POST /camp_registration.xml
  def create
    payment_url = params[:camp][:payment_url]
    @camp_registration = CampRegistration.new(CampRegistration.format_for_save(params[:camp_registration]))

      if @camp_registration.save
        CampRegistrationMailer.registration_email(@camp_registration).deliver unless @camp_registration.email.nil?
        redirect_to payment_url
      else
        @camp = RegistrationForm.find_by_id(@camp_registration.registration_form_id).camp
        render :action => "new"
      end
  end

  # PUT /camp_registration/1
  # PUT /camp_registration/1.xml
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

  # DELETE /camp_registration/1
  # DELETE /camp_registration/1.xml
  def destroy
    @camp_registration.destroy
  end

  private

  def find_registration
    @camp_registration = CampRegistration.find(params[:id])
  end
end
