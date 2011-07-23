require 'spec_helper'

describe BattleNet do
  describe "#region" do
    before(:each) { BattleNet.region = Regions::US }
    
    it "sets the base uri to a region" do
      BattleNet.region = Regions::US
      BattleNet.region.should == "us.battle.net"
      
      BattleNet.region = Regions::EU
      BattleNet.region.should == "eu.battle.net"
      
      BattleNet.region = Regions::KR
      BattleNet.region.should == "kr.battle.net"
      
      BattleNet.region = Regions::TW
      BattleNet.region.should == "tw.battle.net"
      
      BattleNet.region = Regions::CN
      BattleNet.region.should == "www.battlenet.com.cn"
    end
    
    it "defaults to US region" do
      BattleNet::DEFAULT_REGION.should == Regions::US
    end
    
    it "can switch regions" do
      BattleNet.region = Regions::EU
      BattleNet.region.should == Realm.region
      Realm.region.should == "eu.battle.net"
      
      BattleNet.region = Regions::KR
      BattleNet.region.should == Realm.region
      Realm.region.should == "kr.battle.net"
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
