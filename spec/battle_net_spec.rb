require 'spec_helper'

describe BattleNet do
  describe "#region" do
    before(:each) { BattleNet.region = Regions::US }
    
    it "sets the base uri to a region" do
      BattleNet.region = Regions::US
      BattleNet.region.should == "http://us.battle.net/api/wow"
      
      BattleNet.region = Regions::EU
      BattleNet.region.should == "http://eu.battle.net/api/wow"
      
      BattleNet.region = Regions::KR
      BattleNet.region.should == "http://kr.battle.net/api/wow"
      
      BattleNet.region = Regions::TW
      BattleNet.region.should == "http://tw.battle.net/api/wow"
      
      BattleNet.region = Regions::CN
      BattleNet.region.should == "http://www.battlenet.com.cn/api/wow"
    end
    
    it "defaults to US region" do
      BattleNet::DEFAULT_REGION.should == Regions::US
    end
    
    it "can switch regions" do
      BattleNet.region = Regions::EU
      BattleNet.region.should == Realm.region
      
      BattleNet.region = Regions::KR
      BattleNet.region.should == Realm.region
    end
    
    it "returns nil for 404 not found error" do
      stub_error 'http://us.battle.net/api/wow/xyz', 404

      BattleNet.get("/xyz").should be_nil
    end
    
    it "returns nil for 500 server error" do
      stub_error 'http://us.battle.net/api/wow/guild/arygos/xyz', 500

      BattleNet.get("/guild/arygos/xyz").should be_nil
    end
  end
end
