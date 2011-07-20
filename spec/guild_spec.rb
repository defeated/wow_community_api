require 'spec_helper'

describe Guild do
  describe "#find_by_realm_and_name" do
    it "gets guild by realm and name" do
      stub_json 'http://us.battle.net/api/wow/guild/uther/nova', 'guild.json'

      guild = Guild.find_by_realm_and_name("uther", "nova")
      guild.name.should == "Nova"
    end

    it 'gets a guild with spaces by realm and name' do
      stub_json 'http://us.battle.net/api/wow/guild/altar of storms/devilsaur may cry', 'guild-dmc.json'

      guild = Guild.find_by_realm_and_name('altar of storms', 'devilsaur may cry')
      guild.realm.should == 'Altar of Storms'
      guild.name.should == 'Devilsaur May Cry'
    end
    
    it 'gets a guild with optional field members' do
      stub_json 'http://us.battle.net/api/wow/guild/arygos/is%20epic?fields=members', 'guild-members.json'

      guild = Guild.find_by_realm_and_name('arygos', 'is epic', :members)
      guild.members.size.should == 3
      guild.members[0].character.name.should == "Myrlidaren"
    end
    
    it 'gets a guild with multiple optional fields' do
      stub_json 'http://us.battle.net/api/wow/guild/arygos/is%20epic?fields=members,achievements', 'guild-all-fields.json'

      guild = Guild.find_by_realm_and_name('arygos', 'is epic', :members, :achievements)
      guild.members.size.should == 3
      guild.members[0].character.name.should == "Myrlidaren"
      guild.achievements.achievementsCompleted.size.should == 3
    end
  end
end
