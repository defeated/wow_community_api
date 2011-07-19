require 'spec_helper'

describe Realm do
  describe "#find_by_name" do
    it "gets the status of a realm by name" do
      stub_json 'http://us.battle.net/api/wow/realm/status?realms=medivh', 'realms.json'

      realm = Realm.find_by_name("medivh")
      realm.status.should be_true
    end

    it 'gets the status of a realm with spaces by name' do
      stub_json 'http://us.battle.net/api/wow/realm/status?realms=altar of storms', 'realms-aos.json'

      realm = Realm.find_by_name("altar of storms")
      realm.status.should be_true
    end
    
    it "gets multiple realms by name" do
      stub_json 'http://us.battle.net/api/wow/realm/status?realms=medivh,lightbringer', 'realms.json'

      realms = Realm.find_by_name("medivh", "lightbringer")
      realms.size.should == 2
      realms[0].name.should == "Medivh"
      realms[1].name.should == "Lightbringer"
    end
  end
end
