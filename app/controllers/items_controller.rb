class ItemsController < ApplicationController
  # GET /items
  # GET /items.xml
  before_filter :authenticate_user!, :except => [:show, :welcome, :videos, :contact]
  before_filter :find_item, :only => [:show, :edit, :update, :destroy]

  def index
    if params[:type] == "page"
      @items = Page.list_order
    elsif params[:type] == "category"
      @items = Category.list_order
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @items }
    end
  end

  # GET /items/1
  # GET /items/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @item = Item.new
    @item.type = params[:type].classify
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/1/edit
  def edit

    respond_to do |format|
      format.html { render :action => :edit }
      format.xml  { render :xml => @item }
    end
  end

  # POST /items
  # POST /items.xml
  def create
    @item = Item.new(params[:item])
    @item.type = params[:item][:type]

    respond_to do |format|
      if @item.save
        format.html { redirect_to(@item, :notice => 'Item was successfully created.') }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new", :alert => 'There was a problem creating this item.' }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update
    @item.update_attributes(params[:item])

    respond_to do |format|

      if @item.update_attributes(params[@item.type.to_s.downcase])
        format.html { redirect_to(@item, :notice => 'Item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    type = @item.type.to_s.downcase
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url(:type => type) }
      format.xml  { head :ok }
    end
  end

  def videos
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
    unless @item = Item.find_by_title((params[:id]).to_s.titleize)
      redirect_to(root_path)
    end
  end
end 
