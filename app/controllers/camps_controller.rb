class CampsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]

  def admin
    @camps = Camp.all
  end

  def new
    @camp = Camp.new
    @camp.registration_form = RegistrationForm.new
  end

  def index
    @high_school = Camp.high_school_camps
    @junior_high = Camp.junior_high_camps
    @other_camps = Camp.other_camps

    @month = (params[:month] || Time.zone.now.month).to_i
    @year = (params[:year] || Time.zone.now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = Camp.event_strips_for_month(@shown_month)
  end

  def show
    @camp = Camp.find_by_slug(params[:id])
    @camp_registration = CampRegistration.new
  end

  def edit
    @camp = Camp.find_by_slug(params[:id])
  end

  def create
    @camp = Camp.new(params[:camp])

    respond_to do |format|
      if @camp.save
        format.html { redirect_to(@camp, :notice => 'Camp was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @camp = Camp.find_by_slug(params[:id])

    respond_to do |format|
      if @camp.update_attributes(params[:camp])
        format.html { redirect_to(@camp, :notice => 'Camp was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @camp = Camp.find_by_slug(params[:id])
    @camp.destroy

    redirect_to(admin_camps_url)
  end
end
