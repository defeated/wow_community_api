require 'wow_community_api'
require 'webmock/rspec'

include WowCommunityApi

def stub_json(uri, filename)
  body = open("spec/fixtures/#{filename}")
  stub_request(:get, uri).to_return(:body => body, :headers => { 'Content-Type' => 'application/json' })
end

def stub_error(uri, status)
  body = open("spec/fixtures/error.json")
  stub_request(:get, uri).to_return(:body => body, :status => status)
end
