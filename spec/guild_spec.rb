require 'spec_helper'

describe Guild do
  describe "#find_by_realm_and_name" do
    before do
      expected_uri = "http://us.battle.net/api/wow/guild/uther/nova"
      expected_body = '{ lastModified: 1310345452000, name: "Nova", realm: "Uther", level: 22, side: 0, achievementPoints: 510 }'
      stub_request(:get, expected_uri).to_return(:body => expected_body, :headers => { 'Content-Type' => 'application/json' })
    end
    
    it "gets guild by realm and name" do
      guild = Guild.find_by_realm_and_name("uther", "nova")
      guild.name.should == "Nova"
    end
  end
end
