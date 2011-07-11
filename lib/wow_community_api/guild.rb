module WowCommunityApi
  class Guild < BattleNet
    def self.find_by_realm_and_name(realm, name)
      OpenStruct.new get("/guild/#{realm}/#{name}")
    end
  end
end
