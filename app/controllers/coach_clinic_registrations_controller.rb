class CoachClinicRegistrationsController < ApplicationController
  before_filter :authenticate_user!, :except => [:new, :create]
  before_filter :find_registrations, :only => [:show, :edit, :update, :destroy]

  def index
    @coach_clinic_registrations = CoachClinicRegistration.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @coach_clinic_registrations }
    end
  end

  # GET /coach_clinic_registrations/1
  # GET /coach_clinic_registrations/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @coach_clinic_registration }
    end
  end

  # GET /coach_clinic_registrations/new
  # GET /coach_clinic_registrations/new.xml
  def new
    @coach_clinic_registration = CoachClinicRegistration.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @coach_clinic_registration }
    end
  end

  # GET /coach_clinic_registrations/1/edit
  def edit
  end

  # POST /coach_clinic_registrations
  # POST /coach_clinic_registrations.xml
  def create
    @coach_clinic_registration = CoachClinicRegistration.new(params[:coach_clinic_registration])

    respond_to do |format|
      if @coach_clinic_registration.save
        format.html { redirect_to(new_coach_clinic_registration_path, :notice => 'Thank you for registering for the clinic! We will be in contact with you shortly.') }
      else
        format.html { render :action => "new", :error => "Failed to register for the camp. Please try again!" }
      end
    end
  end

  # PUT /coach_clinic_registrations/1
  # PUT /coach_clinic_registrations/1.xml
  def update

    respond_to do |format|
      if @coach_clinic_registration.update_attributes(params[:coach_clinic_registration])
        format.html { redirect_to(@coach_clinic_registration, :notice => 'Coach clinic registration was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @coach_clinic_registration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /coach_clinic_registrations/1
  # DELETE /coach_clinic_registrations/1.xml
  def destroy
    @coach_clinic_registration.destroy

    respond_to do |format|
      format.html { redirect_to(coach_clinic_registrations_url) }
      format.xml  { head :ok }
    end
  end

  private

  def find_registrations
    @coach_clinic_registration = CoachClinicRegistration.find(params[:id])
  end
end
