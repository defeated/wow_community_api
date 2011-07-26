module WowCommunityApi
  class Guild < BattleNet
    def self.find_by_realm_and_name(realm, name, *field)
      fields = { :fields => field.join(",") } unless field.empty?
      get("/guild/#{realm}/#{name}", fields).to_ostruct
    end
  end
end
