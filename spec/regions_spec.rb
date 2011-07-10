require 'wow_community_api'

include WowCommunityApi

describe Regions do
  describe "valid regions" do
    it "supports the united states" do
      Regions::US.should == "us"
    end
    
    it "supports europe" do
      Regions::EU.should == "eu"
    end
    
    it "supports korea" do
      Regions::KR.should == "kr"
    end
    
    it "supports taiwan" do
      Regions::TW.should == "tw"
    end
  end
end
