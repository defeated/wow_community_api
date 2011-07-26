module WowCommunityApi
  class BattleNet
    include HTTParty
    
    # TODO: make this configurable?
    DEFAULT_REGION = Regions::US
    DEFAULT_LOCALE = nil
  
    cattr_accessor(:region) { DEFAULT_REGION }
    cattr_accessor(:locale) { DEFAULT_LOCALE }
    
    def self.get(path, options = nil)
      base_uri "http://#{self.region}/api/wow"

      results = super(URI.encode(path), build_query(options))
      results.parsed_response if results.response.code == "200"
    end
    
    def self.build_query(options)
      query = { :query => options }
      query[:query].merge!(:locale => locale) if locale
      query
    end
    
    def self.reset!
      self.region = DEFAULT_REGION
      self.locale = DEFAULT_LOCALE
    end

  end
end
