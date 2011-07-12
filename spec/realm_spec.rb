require 'spec_helper'

describe Realm do
  describe "#find_by_name" do
    it "gets the status of a realm by name" do
      stub_json 'http://us.battle.net/api/wow/realm/status?realms=medivh', 'realms.json'
      realm = Realm.find_by_name("medivh")
      realm.status.should be_true
    end
  end
end
