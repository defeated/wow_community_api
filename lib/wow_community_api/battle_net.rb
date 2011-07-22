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
      results = super(URI.encode(path), options)
      results.to_ostruct if results.response.code == "200"
    end

  end
end
