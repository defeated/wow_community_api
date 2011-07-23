module WowCommunityApi
  class BattleNet
    include HTTParty
    
    # TODO: make this configurable?
    DEFAULT_REGION = Regions::US
  
    def self.region(path)
      self.base_uri "#{path}/api/wow"
    end
    base_uri region(DEFAULT_REGION)
    
    def self.get(path, options = {})
      results = super(URI.encode(path), options)
      results.parsed_response.to_ostruct if results.response.code == "200"
    end

  end
end
