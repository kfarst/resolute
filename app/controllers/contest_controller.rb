class ContestController < ApplicationController
  # GET /contests/new
  # GET /contests/new.xml
  layout nil
  before_filter :authenticate_user!, :expect => [:new]

  def new
    @contest = Contest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contest }
    end
  end

  # POST /contests
  # POST /contests.xml
  def create
    @contest = Contest.new(params[:contest])

    respond_to do |format|
      if @contest.save
        format.html { redirect_to new_contest_path, :notice => 'Contest was successfully entered.' }
        format.xml  { render :xml => @contest, :status => :created, :location => @contest }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contest.errors, :status => :unprocessable_entity }
      end
    end
  end

end
