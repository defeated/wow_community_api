module WowCommunityApi
  class Character < BattleNet
    def self.find_by_realm_and_name(realm, name)
      OpenStruct.new get("/character/#{realm}/#{name}")
    end
  end
end
