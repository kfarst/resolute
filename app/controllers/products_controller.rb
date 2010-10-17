class ProductsController < ApplicationController
  before_filter :authenticate_user!, :except => [:store]
  before_filter :find_product, :only => [:show, :edit, :update, :destroy]

  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def store
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
  end

  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
  end

  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to(@product, :notice => 'Product was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to(@product, :notice => 'Product was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end
end
