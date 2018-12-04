require 'octokit'

Octokit.configure do |c|
  c.api_endpoint = "https://github.com/api/v3/"
end

Octokit.auto_paginate = true

client = Octokit::Client.new(:access_token => "")

org = ARGV[0]

for repo in client.org_repos(org)
  puts "#{org},#{repo.name}"
end
