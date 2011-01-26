class TournamentPagesController < ApplicationController
  # GET /tournament_pages
  # GET /tournament_pages.xml
  def index
    @tournament_pages = TournamentPage.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tournament_pages }
    end
  end

  # GET /tournament_pages/1
  # GET /tournament_pages/1.xml
  def show
    @tournament_page = TournamentPage.find(params[:id])

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
    @tournament_page = TournamentPage.find(params[:id])
  end

  # POST /tournament_pages
  # POST /tournament_pages.xml
  def create
    @tournament_page = TournamentPage.new(params[:tournament_page])

    respond_to do |format|
      if @tournament_page.save
        format.html { redirect_to(@tournament_page, :notice => 'Tournament page was successfully created.') }
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
    @tournament_page = TournamentPage.find(params[:id])

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
    @tournament_page = TournamentPage.find(params[:id])
    @tournament_page.destroy

    respond_to do |format|
      format.html { redirect_to(tournament_pages_url) }
      format.xml  { head :ok }
    end
  end
end
