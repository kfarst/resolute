class ResoluteTeamSignUpsController < ApplicationController
  # GET /resolute_team_sign_ups
  # GET /resolute_team_sign_ups.xml
  before_filter :authenticate_user!, :except => [:new, :create]

  def index
    @resolute_team_sign_ups = ResoluteTeamSignUp.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @resolute_team_sign_ups }
    end
  end

  # GET /resolute_team_sign_ups/1
  # GET /resolute_team_sign_ups/1.xml
  def show
    @resolute_team_sign_up = ResoluteTeamSignUp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @resolute_team_sign_up }
    end
  end

  # GET /resolute_team_sign_ups/new
  # GET /resolute_team_sign_ups/new.xml
  def new
    @resolute_team_sign_up = ResoluteTeamSignUp.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @resolute_team_sign_up }
    end
  end

  # GET /resolute_team_sign_ups/1/edit
  def edit
    @resolute_team_sign_up = ResoluteTeamSignUp.find(params[:id])
  end

  # POST /resolute_team_sign_ups
  # POST /resolute_team_sign_ups.xml
  def create
    @resolute_team_sign_up = ResoluteTeamSignUp.new(params[:resolute_team_sign_up])

    respond_to do |format|
      if @resolute_team_sign_up.save
        format.html { redirect_to("/elite-teams", :notice => 'Thank you for signing up! We will be in contact with you shortly.') }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @resolute_team_sign_up.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /resolute_team_sign_ups/1
  # PUT /resolute_team_sign_ups/1.xml
  def update
    @resolute_team_sign_up = ResoluteTeamSignUp.find(params[:id])

    respond_to do |format|
      if @resolute_team_sign_up.update_attributes(params[:resolute_team_sign_up])
        format.html { redirect_to(@resolute_team_sign_up, :notice => 'Resolute team sign up was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @resolute_team_sign_up.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /resolute_team_sign_ups/1
  # DELETE /resolute_team_sign_ups/1.xml
  def destroy
    @resolute_team_sign_up = ResoluteTeamSignUp.find(params[:id])
    @resolute_team_sign_up.destroy

    respond_to do |format|
      format.html { redirect_to(resolute_team_sign_ups_url) }
      format.xml  { head :ok }
    end
  end
end
