require 'spec_helper'

describe Regions do
  describe "valid regions" do
    it "supports the united states" do
      Regions::US.should == "us.battle.net"
    end
    
    it "supports europe" do
      Regions::EU.should == "eu.battle.net"
    end
    
    it "supports korea" do
      Regions::KR.should == "kr.battle.net"
    end
    
    it "supports taiwan" do
      Regions::TW.should == "tw.battle.net"
    end
    
    it "supports china" do
      Regions::CN.should == "www.battlenet.com.cn"
    end
  end
end
