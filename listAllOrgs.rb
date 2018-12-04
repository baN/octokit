require 'octokit'

github_token = ARGV[0]
github_id = ARGV[1]

Octokit.configure do |c|
  c.api_endpoint = "https://github.com/api/v3/"
end
Octokit.auto_paginate = true

client = Octokit::Client.new(:access_token => github_token)

puts "listing all orgs.."
# for org in  client.all_organizations
#   puts "#{org.login}"
# end
puts client.all_organizations[0].inspect
