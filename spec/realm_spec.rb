require 'spec_helper'

describe Realm do
  describe "#status" do
    before do
      BattleNet.region('us')
      expected_uri = "http://us.battle.net/api/wow/realm/status?realms=arygos"
      expected_body = '{"realms":[{ "type":"pve", "queue":false, "status":true, "population":"medium", "name":"Arygos", "slug":"arygos"}]}'
      stub_request(:get, expected_uri).to_return(:body => expected_body, :headers => { 'Content-Type' => 'application/json' })
    end
    
    it "gets the status of a realm by name" do
      realm = Realm.find_by_name("arygos")
      realm.status.should be_true
    end
  end
end
