require 'spec_helper'

describe Character do
  describe "#find_by_realm_and_name" do
    before do
      expected_uri = "http://us.battle.net/api/wow/character/uther/malkyth"
      expected_body = '{ lastModified: 1310338638000, name: "Malkyth", realm: "Uther", class: 9, race: 5, gender: 0, level: 85, achievementPoints: 10970, thumbnail: "uther/243/6004211-avatar.jpg" }'
      stub_request(:get, expected_uri).to_return(:body => expected_body, :headers => { 'Content-Type' => 'application/json' })
    end
    
    it "gets character by realm and name" do
      character = Character.find_by_realm_and_name("uther", "malkyth")
      character.name.should == "Malkyth"
    end
  end
end
