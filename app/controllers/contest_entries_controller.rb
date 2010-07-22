class ContestEntriesController < ApplicationController
  # GET /contest_entries/new
  # GET /contest_entries/new.xml
  before_filter :authenticate_user!, :except => [:new]

  def new
    @contest_entry = ContestEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contest_entry }
    end
  end

  def index
  end

  # POST /contests
  # POST /contests.xml
  def create
    @contest_entry = ContestEntry.new(params[:contest_entry])

    respond_to do |format|
      if @contest_entry.save
        format.html { redirect_to new_contest_entry_path, :notice => 'Contest was successfully entered.' }
        format.xml  { render :xml => @contest_entry, :status => :created, :location => @contest_entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contest_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
   @contest_entry = ContestEntry.find(params[:id])
   @contest_entry.destroy

   render :action => :index
  end

end
