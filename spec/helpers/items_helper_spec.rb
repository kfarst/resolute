require 'spec_helper'

describe ItemsHelper do
  describe ".get_type_from_position" do
    context "with a position of 1" do
      context "and a type of category" do
        subject { get_type_from_position(1, "/categories/new") }
        it { should == "categories" }
      end

      context "and a type of page" do
        subject { get_type_from_position(1, "/pages/new") }
        it { should == "pages" }
      end
    end

    context "with a position of 2" do
      context "and a type of category" do
        subject { get_type_from_position(2, "/items/categories") }
        it { should == "categories" }
      end

      context "and a type of page" do
        subject { get_type_from_position(2, "/items/pages") }
        it { should == "pages" }
      end
    end
  end

  describe ".is_page?" do
    context "when type is a page" do
      subject { is_page?("Page") }
      it { should be_true }
    end

    context "when type is a category" do
      subject { is_page?("Category") }
      it { should be_false }
    end
  end

  describe ".item_type_for_form_has" do
    context "when item is of type page" do
      subject { item_type_for_form_hash(Page.new(:title => "Page")) }
      it { should == "page" }
    end

    context "when item is of type category" do
      subject { item_type_for_form_hash(Category.new(:title => "Category")) }
      it { should == "category" }
    end

    context "when item does not have a type yet" do
      subject { item_type_for_form_hash(Item.new(:title => "Item")) }
      it { should == "item" }
    end
  end
end
