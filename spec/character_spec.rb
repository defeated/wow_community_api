require 'spec_helper'

describe Character do
  describe "#find_by_realm_and_name" do
    it "gets character by realm and name" do
      stub_json "http://us.battle.net/api/wow/character/uther/malkyth", 'character.json'

      character = Character.find_by_realm_and_name("uther", "malkyth")
      character.name.should == "Malkyth"
    end

    it 'gets a character from a realm with spaces by realm and name' do
      stub_json "http://us.battle.net/api/wow/character/altar of storms/johndoe", 'character-doe.json'

      character = Character.find_by_realm_and_name('altar of storms', 'johndoe')
      character.realm.should == 'Altar of Storms'
      character.name.should == 'Johndoe'
    end
    
    it 'gets a character with optional field guild' do
      stub_json 'http://us.battle.net/api/wow/character/uther/malkyth?fields=guild', 'character-guild.json'

      character = Character.find_by_realm_and_name('uther', 'malkyth', :guild)
      character.guild.name.should == "Havok"
      character.guild.emblem.icon.should == 106
    end
    
    it 'gets a character with multiple optional fields' do
      stub_json 'http://us.battle.net/api/wow/character/uther/malkyth?fields=guild,titles', 'character-all-fields.json'

      character = Character.find_by_realm_and_name('uther', 'malkyth', :guild, :titles)
      character.guild.name.should == "Havok"
      character.titles.size.should == 3
      character.titles[0].name.should == "Centurion %s"
    end
    
    it 'gets a character with foreign locale' do
      BattleNet.locale = Locales::US::ES_MX
      
      stub_json 'http://us.battle.net/api/wow/character/uther/malkyth?fields=titles&locale=es_MX', 'character-mexican.json'

      character = Character.find_by_realm_and_name('uther', 'malkyth', :titles)
      character.titles[0].name.should == "Conquistador %s"
    end
    
    it 'gets the class of a character' do
      stub_json "http://us.battle.net/api/wow/character/uther/malkyth", 'character.json'

      character = Character.find_by_realm_and_name("uther", "malkyth")
      character.class_id.should == 9
    end
  end
end
