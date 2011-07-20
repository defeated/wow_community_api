module WowCommunityApi
  class Realm < BattleNet
    def self.find_by_name(*name)
      names = { :realms => name.join(",") } unless name.empty?
      results = get("/realm/status", :query => names)
      (name.size == 1) ? results.realms.first : results.realms
    end

    def self.find_all()
      find_by_name
    end
  end
end
