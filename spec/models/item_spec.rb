require 'spec_helper'

describe Item do
  describe "#get_youtube_videos" do 
    it "should return a YouTube video feed" do
      Item.get_youtube_videos.feed_id == "http://gdata.youtube.com/feeds/api/videos"
    end
  end
end
