module WowCommunityApi
  class Guild < BattleNet
    def self.find_by_realm_and_name(realm, name)
      OpenStruct.new get("/guild/%s/%s" % [realm, name].map {|uri| URI.encode(uri)})
    end
  end
end
