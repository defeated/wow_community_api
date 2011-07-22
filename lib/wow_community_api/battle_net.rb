module WowCommunityApi
  class BattleNet
    include HTTParty
    
    # TODO: make this configurable?
    DEFAULT_REGION = Regions::US
  
    def self.region(name)
      self.base_uri "#{name}.battle.net/api/wow"
    end
    base_uri region(DEFAULT_REGION)
    
    def self.get(path, options = {})
      super(URI.encode(path), options).to_ostruct
    end

  end
end
