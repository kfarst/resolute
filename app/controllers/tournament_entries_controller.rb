class TournamentEntriesController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :destroy]

  def new
    @tournament_entry = TournamentEntry.new
  end

  def create
    @tournament_entry = TournamentEntry.new(params[:tournament_entry])

    if @tournament_entry.save
      TournamentMailer.response_email(@tournament_entry).deliver
      redirect_to "https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=8U3CLMU3ERLEG"
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
