# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "wow_community_api/version"

Gem::Specification.new do |s|
  s.name        = "wow_community_api"
  s.version     = WowCommunityApi::VERSION
  s.authors     = ["eddie cianci"]
  s.email       = ["defeated2k4@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "wow_community_api"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
