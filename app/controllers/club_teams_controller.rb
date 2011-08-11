class ClubTeamsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]

  def admin
    if params[:general_pages]
      @club_teams = ClubTeam.general_pages
    else
      @club_teams = ClubTeam.main_pages
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @club_teams }
    end
  end

  # GET /club_teams
  # GET /club_teams.xml
  def index
    @club_team = ClubTeam.general_pages.first
    render :show
  end

  # GET /club_teams/1
  # GET /club_teams/1.xml
  def show
    @club_team = parent = ClubTeam.find_by_slug(params[:parent_slug])
    
    unless params[:child_slug].nil?
      @club_team = ClubTeam.find_by_slug_and_parent_id(params[:child_slug], parent.id)
    end

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
    @club_team = ClubTeam.find_by_id(params[:id])
  end

  # POST /club_teams
  # POST /club_teams.xml
  def create
    @club_team = ClubTeam.new(params[:club_team])

    if params[:general_page]
      @club_team.general_page = true
    else
      @club_team.general_page = false
    end

    respond_to do |format|
      if @club_team.save
        if @club_team.general_page?
          format.html { redirect_to(admin_club_teams_path(:general_pages => true), :notice => 'Club team was successfully created.') }
        else
          format.html { redirect_to(admin_club_teams_path, :notice => 'Club team was successfully created.') }
        end
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /club_teams/1
  # PUT /club_teams/1.xml
  def update
    @club_team = ClubTeam.find_by_id(params[:id])

    respond_to do |format|
      if @club_team.update_attributes(params[:club_team])
        if @club_team.general_page?
          format.html { redirect_to(admin_club_teams_path(:general_pages => true), :notice => 'Club team was successfully updated.') }
        else
          format.html { redirect_to(admin_club_teams_path, :notice => 'Club team was successfully updated.') }
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @club_team.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /club_teams/1
  # DELETE /club_teams/1.xml
  def destroy
    @club_team = ClubTeam.find_by_id(params[:id])
    general_page = @club_team.general_page?
    @club_team.destroy

    respond_to do |format|
      if general_page
        format.html { redirect_to(admin_club_teams_url(:general_pages => true)) }
      else
        format.html { redirect_to(admin_club_teams_url) }
      end
    end
  end
end

