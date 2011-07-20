module WowCommunityApi
  class Character < BattleNet
    def self.find_by_realm_and_name(realm, name, *field)
      fields = { :fields => field.join(",") } if field.size > 0
      get("/character/#{realm}/#{name}", :query => fields)
    end
  end
end
