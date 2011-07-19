# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "wow_community_api/version"

Gem::Specification.new do |s|
  s.name        = "wow_community_api"
  s.version     = WowCommunityApi::VERSION
  s.authors     = ["eddie cianci"]
  s.email       = ["defeated2k4@gmail.com"]
  s.homepage    = "http://github.com/defeated/wow_community_api"
  s.summary     = %q{World of Warcraft Community Platform API}
  s.description = %q{a Ruby library for Blizzard's World of Warcraft Community Platform API}

  s.rubyforge_project = "wow_community_api"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "httparty"
  s.add_dependency "hash-to-ostruct"

  s.add_development_dependency "rspec"
  s.add_development_dependency "webmock"
end
