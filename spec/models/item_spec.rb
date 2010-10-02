require 'spec_helper'

describe Item do
  describe "#get_youtube_videos" do 
    it "should return an array of youtube objects" do
      Item.get_youtube_videos.should be_a(YouTube)
    end
  end
end
