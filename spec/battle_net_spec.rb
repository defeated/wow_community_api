require 'spec_helper'

describe BattleNet do
  describe "#region" do
    it "sets the base uri to a region" do
      BattleNet.region(Regions::US).should == "http://us.battle.net/api/wow"
      BattleNet.region(Regions::EU).should == "http://eu.battle.net/api/wow"
      BattleNet.region(Regions::KR).should == "http://kr.battle.net/api/wow"
      BattleNet.region(Regions::TW).should == "http://tw.battle.net/api/wow"
    end
  end
end
