module WowCommunityApi
  class Character < BattleNet
    def self.find_by_realm_and_name(realm, name, *field)
      fields = { :fields => field.join(",") } unless field.empty?
      results = get("/character/#{realm}/#{name}", fields)

      results['class_id'] = results.delete('class') # handle reserved word "class"
      results.to_ostruct
    end
  end
end
