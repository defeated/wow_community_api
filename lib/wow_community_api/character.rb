module WowCommunityApi
  class Character < BattleNet
    def self.find_by_realm_and_name(realm, name)
      get("/character/#{realm}/#{name}").to_ostruct
    end
  end
end
