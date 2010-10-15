require 'spec_helper'

describe Product do
  before(:each) do
    @product = Factory.build(:product)
  end

  it "saves with valid attributes" do
    @product.save.should be_true
  end

  it "does not save without a name" do
    @product.name = ""
    @product.save.should be_false
  end

  it "does not save without a URL" do
    @product.url = ""
    @product.save.should be_false
  end

  it "does not save without a price" do
    @product.price = ""
    @product.save.should be_false
  end

  it "does not save if price is a number" do
    @product.price = "aldsifjadslj"
    @product.save.should be_false
  end
end
