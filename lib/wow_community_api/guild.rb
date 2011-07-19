module WowCommunityApi
  class Guild < BattleNet
    def self.find_by_realm_and_name(realm, name)
      get("/guild/#{realm}/#{name}").to_ostruct
    end
  end
end
