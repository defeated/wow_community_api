module WowCommunityApi
  class Character < BattleNet
    def self.find_by_realm_and_name(realm, name)
      OpenStruct.new get("/character/%s/%s" % [realm, name].map {|uri| URI.encode(uri)})
    end
  end
end
