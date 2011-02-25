require 'spec_helper'

describe Panel do
  context "with no fields" do
    let(:panel) { Panel.new }
  
    it "saves the record" do
     panel.save.should be_true # false positive, catches it later
    end
  end
  
  context "with one field" do
    let(:panel) { Panel.new(:title => "Test Panel") }
  
    it "does not save the record" do
      panel.save.should be_false
    end
  end
  
  context "with two fields" do
    let(:panel) { Panel.new(:title => "Test Panel", :panel => "test-panel.png") }
  
    it "does not save the record" do
      panel.save.should be_false
    end
  end
  
  context "with three fields" do
    let(:panel) { Factory.build(:panel) }
  
    it "saves the record" do
      panel.save.should be_true
    end
  end

  describe "#has_any_attributes?" do
    context "with no fields" do
      let(:panel) { Panel.new }
  
      it "returns false" do
       panel.has_any_attributes?.should be_false 
      end
    end
  
    context "with one field" do
      let(:panel) { Panel.new(:title => "Test Panel") }
  
      it "returns true" do
       panel.has_any_attributes?.should be_true
      end
    end
  
    context "with two fields" do
      let(:panel) { Panel.new(:title => "Test Panel", :panel => "test-panel.png") }
  
      it "returns true" do
       panel.has_any_attributes?.should be_true
      end
    end
  
    context "with three fields" do
      let(:panel) { Factory.build(:panel) }
  
      it "returns true" do
         panel.has_any_attributes?.should be_true
      end
    end
  end
  
  describe ".overwrite_existing" do
    context "with no existing panels" do
      before(:each) do
        @panels = []
        ["Left", "Right Top", "Right Bottom"].each do |position|
          @panels << Factory.build(:panel, :position => position)
        end
      end
  
      it "saves all three panels" do
        expect { Panel.overwrite_existing(@panels) }.to change(Panel, :count).from(0).to(3)
      end
    end
  
    context "updating one panel" do
      before(:each) do
        ["Left", "Right Top", "Right Bottom"].each_with_index do |position, index|
          Factory(:panel, :title => "Panel #{index}", :position => position)
        end

        panels = [Factory.build(:panel, :title => "Panel 3", :position => "Left")]
        Panel.overwrite_existing(panels)
      end
  
      it "updates only that panel" do
        Panel.find_by_position("Left").title.should == "Panel 3"
      end

      it "does not change the other two panels" do
        Panel.find_by_position("Right Top").title.should == "Panel 1"
        Panel.find_by_position("Right Bottom").title.should == "Panel 2"
      end

      it "only saves three records" do
        Panel.count.should == 3
      end
    end
  
    context "updating two panels" do
      before(:each) do
        ["Left", "Right Top", "Right Bottom"].each_with_index do |position, index|
          Factory(:panel, :title => "Panel #{index}", :position => position)
        end

        panels = []
        count = 3
        ["Left", "Right Top"].each do |position|
          panels << Factory.build(:panel, :title => "Panel #{count}", :position => position)
          count = count+1
        end
        Panel.overwrite_existing(panels)
      end
  
      it "updates only those two panels" do
        Panel.find_by_position("Left").title.should == "Panel 3"
        Panel.find_by_position("Right Top").title.should == "Panel 4"
      end

      it "does not change the other panel" do
        Panel.find_by_position("Right Bottom").title.should == "Panel 2"
      end

      it "only saves three records" do
        Panel.count.should == 3
      end
    end

    context "updating all panels" do
      before(:each) do
        ["Left", "Right Top", "Right Bottom"].each_with_index do |position, index|
          Factory(:panel, :title => "Panel #{index}", :position => position)
        end

        panels = []
        count = 3
        ["Left", "Right Top", "Right Bottom"].each do |position|
          panels << Factory.build(:panel, :title => "Panel #{count}", :position => position)
          count = count+1
        end
        Panel.overwrite_existing(panels)
      end
  
      it "updates all three panels" do
        Panel.find_by_position("Left").title.should == "Panel 3"
        Panel.find_by_position("Right Top").title.should == "Panel 4"
        Panel.find_by_position("Right Bottom").title.should == "Panel 5"
      end

      it "only saves three records" do
        Panel.count.should == 3
      end
    end
  end

end
