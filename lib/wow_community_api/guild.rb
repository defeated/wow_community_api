module WowCommunityApi
  class Guild < BattleNet
    def self.find_by_realm_and_name(realm, name, *field)
      fields = { :fields => field.join(",") } if field.size > 0
      get("/guild/#{realm}/#{name}", :query => fields)
    end
  end
end
