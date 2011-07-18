require 'spec_helper'

describe Guild do
  describe "#find_by_realm_and_name" do
    it "gets guild by realm and name" do
      stub_json 'http://us.battle.net/api/wow/guild/uther/nova', 'guild.json'
      guild = Guild.find_by_realm_and_name("uther", "nova")
      guild.name.should == "Nova"
    end

    it 'gets a guild with spaces by realm and name' do
      stub_json 'http://us.battle.net/api/wow/guild/durotan/devilsaur may cry', 'guild-dmc.json'

      guild = Guild.find_by_realm_and_name('durotan', 'devilsaur may cry')
      guild.name.should == 'Devilsaur May Cry'
    end
  end
end
