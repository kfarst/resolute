class TournamentEntriesController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :destroy]

  def new
    @tournament_entry = TournamentEntry.new
  end

  def create
    @tournament_entry = TournamentEntry.new(params[:tournament_entry])

    if @tournament_entry.save
      TournamentMailer.response_email(@tournament_entry).deliver
      redirect_to "/midwest-shootout-youth-tournament", :notice => "Thank you for signing your team up! You will receive an email from us shortly."
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
