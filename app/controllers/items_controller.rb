class ItemsController < ApplicationController
  # GET /items
  # GET /items.xml
  before_filter :authenticate_user!, :except => [:show, :welcome, :videos]
  before_filter :find_item, :except => [:index, :new, :welcome, :videos]
  after_filter :no_popup, :only => [:welcome]
  

  def index
    if params[:type] == "page"
      @items = Page.all
    elsif params[:type] == "cat"
      @items = Category.all
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

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.xml
  def create

    respond_to do |format|
      if @item.save
        format.html { redirect_to(@item, :notice => 'Item was successfully created.') }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update

    respond_to do |format|
      if @item.update_attributes(params[@item.type])
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
    @item.destroy

    respond_to do |format|
      format.html { redirect_to(items_url) }
      format.xml  { head :ok }
    end
  end

  def videos
  end

  def welcome
  end

private

  def find_item
    unless @item = Item.find_by_title(params[:id].titleize)
      redirect_to(root_path)
    end
  end

  def no_popup
    cookies[:popup] ||= false
  end
end 
