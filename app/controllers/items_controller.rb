class ItemsController < ApplicationController
  respond_to :html

  before_filter :authenticate_user!, :except => [:show, :welcome, :videos, :contact]
  before_filter :find_item, :only => [:show, :edit, :update, :destroy]

  def pages
    @items = Page.list_order
    render 'index'
  end

  def categories
    @items = Category.list_order
    render 'index'
  end

  def show
    @tournament_entry = TournamentEntry.new
    respond_with @item
  end

  def new
    respond_with @item = Item.new
  end

  def edit
    respond_with @item
  end

  def create
    @item = Item.new(params[:item])
    @item.type = params[:item][:type]

    if @item.save
      redirect_to polymorphic_path(@item)
    else
      render 'new'
    end
  end

  def update
    if @item.update_by_type(params)
      redirect_to polymorphic_path(@item)
    else
      render 'edit'
    end
  end

  def destroy
    respond_with @item.destroy, :method => :put
  end

  def videos
    @channel = Item.get_youtube_videos
  end

  def welcome
  end

  def sort
    params[:item].each_with_index do |item_id, i|
      Item.find(item_id).update_attribute(:position, i)
    end
    render :text => params[:item]
  end

private

  def find_item
    unless @item = Item.find_by_slug(params[:id])
      redirect_to root_path
    end
  end
end 
