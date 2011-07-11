module WowCommunityApi
  class BattleNet
    include HTTParty
  
    def self.region(name)
      self.base_uri "#{name}.battle.net/api/wow"
    end
    base_uri region(Regions::US)

  end
end
