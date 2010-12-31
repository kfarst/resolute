class TournamentEntriesController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :destroy]

  def new
    @tournament_entry = TournamentEntry.new
  end

  def create
    @tournament_entry = TournamentEntry.new(params[:tournament_entry])

    if @tournament_entry.save
      redirect_to :back, :flash => {:info => "Thank you for signing your team up for the tournament!"}
    else
      render :action => :new
    end
  end

  def index
    @tournament_entries = TournamentEntry.all
  end

  def destroy
   @tournament_entry = TournamentEntry.find(params[:id])
   @tournament_entry.destroy

   render :action => :index
  end

end
