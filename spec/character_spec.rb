require 'spec_helper'

describe Character do
  describe "#find_by_realm_and_name" do
    it "gets character by realm and name" do
      stub_json "http://us.battle.net/api/wow/character/uther/malkyth", 'character.json'
      character = Character.find_by_realm_and_name("uther", "malkyth")
      character.name.should == "Malkyth"
    end
  end
end