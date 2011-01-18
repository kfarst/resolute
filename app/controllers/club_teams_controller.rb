class ClubTeamsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  before_filter :authenticate_player!, :only => [:show, :index]

  def admin
    @club_teams = ClubTeam.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @club_teams }
    end
  end

  # GET /club_teams
  # GET /club_teams.xml
  def index
    @club_teams = ClubTeam.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @club_teams }
    end
  end

  # GET /club_teams/1
  # GET /club_teams/1.xml
  def show
    @club_team = ClubTeam.find_by_slug(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @club_team }
    end
  end

  # GET /club_teams/new
  # GET /club_teams/new.xml
  def new
    @club_team = ClubTeam.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @club_team }
    end
  end

  # GET /club_teams/1/edit
  def edit
    @club_team = ClubTeam.find_by_slug(params[:id])
  end

  # POST /club_teams
  # POST /club_teams.xml
  def create
    @club_team = ClubTeam.new(params[:club_team])

    respond_to do |format|
      if @club_team.save
        format.html { redirect_to(admin_club_teams_path, :notice => 'Club team was successfully created.') }
        format.xml  { render :xml => @club_team, :status => :created, :location => @club_team }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @club_team.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /club_teams/1
  # PUT /club_teams/1.xml
  def update
    @club_team = ClubTeam.find_by_slug(params[:id])

    respond_to do |format|
      if @club_team.update_attributes(params[:club_team])
        format.html { redirect_to(admin_club_teams_path, :notice => 'Club team was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @club_team.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /club_teams/1
  # DELETE /club_teams/1.xml
  def destroy
    @club_team = ClubTeam.find_by_slug(params[:id])
    @club_team.destroy

    respond_to do |format|
      format.html { redirect_to(admin_club_teams_url) }
      format.xml  { head :ok }
    end
  end
end

