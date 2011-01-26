class TournamentPagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index, :registration]

  def index
    if TournamentPage.count.zero?
      redirect_to registration_tournament_pages_path
    else
      @tournament_page = TournamentPage.list_order.first
      render :show
    end
  end

  def admin
    @tournament_pages = TournamentPage.all
  end

  # GET /tournament_pages/1
  # GET /tournament_pages/1.xml
  def show
    @tournament_page = TournamentPage.find_by_slug(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tournament_page }
    end
  end

  # GET /tournament_pages/new
  # GET /tournament_pages/new.xml
  def new
    @tournament_page = TournamentPage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tournament_page }
    end
  end

  # GET /tournament_pages/1/edit
  def edit
    @tournament_page = TournamentPage.find_by_slug(params[:id])
  end

  # POST /tournament_pages
  # POST /tournament_pages.xml
  def create
    @tournament_page = TournamentPage.new(params[:tournament_page])

    respond_to do |format|
      if @tournament_page.save
        format.html { redirect_to(admin_tournament_pages_path, :notice => 'Tournament page was successfully created.') }
        format.xml  { render :xml => @tournament_page, :status => :created, :location => @tournament_page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tournament_page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tournament_pages/1
  # PUT /tournament_pages/1.xml
  def update
    @tournament_page = TournamentPage.find_by_slug(params[:id])

    respond_to do |format|
      if @tournament_page.update_attributes(params[:tournament_page])
        format.html { redirect_to(@tournament_page, :notice => 'Tournament page was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tournament_page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tournament_pages/1
  # DELETE /tournament_pages/1.xml
  def destroy
    @tournament_page = TournamentPage.find_by_slug(params[:id])
    @tournament_page.destroy

    respond_to do |format|
      format.html { redirect_to(admin_tournament_pages_url, :notice => 'Tournament page was deleted.') }
      format.xml  { head :ok }
    end
  end

  def registration
    @tournament_entry = TournamentEntry.new
  end

  def sort
    params[:tournament_page].each_with_index do |tournament_page_id, i|
      TournamentPage.find_by_id(tournament_page_id).update_attribute(:position, i)
    end
    render :text => params[:tournament_page]
  end
end
