module WowCommunityApi
  class BattleNet
    include HTTParty
    
    # TODO: make this configurable?
    DEFAULT_REGION = Regions::US
  
    def self.region
      @@region
    end
    def self.region=(path)
      @@region = "http://#{path}/api/wow"
    end
    self.region = DEFAULT_REGION
    
    def self.get(path, options = {})
      base_uri self.region
      results = super(URI.encode(path), options)
      results.parsed_response.to_ostruct if results.response.code == "200"
    end

  end
end
