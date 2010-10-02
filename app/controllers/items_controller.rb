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
    @camp_registration = CampRegistrations.new
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

    respond_with @item.save, :method => :get
  end

  def update
    respond_with @item.update_attributes(params[:item])
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

  def is_page?(item)
    item.type == "Page"
  end
  helper_method :is_page?

private

  def find_item
    unless @item = Item.find_by_slug(params[:id])
      redirect_to rooth_path
    end
  end
end 
