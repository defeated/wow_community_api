require 'spec_helper'

describe BattleNet do
  describe "#locale" do
    
    it "sets the locale" do
      BattleNet.locale = Locales::US::EN_US

      BattleNet.locale.should == Locales::US::EN_US
      BattleNet.locale.should == "en_US"
    end

  end
end
