module WowCommunityApi
  class Realm < BattleNet
    def self.find_by_name(name)
      results = get("/realm/status", :query => { :realms => name })
      realm = results['realms'].first
      OpenStruct.new realm
    end
  end
end
