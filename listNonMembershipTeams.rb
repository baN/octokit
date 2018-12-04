require 'octokit'

username = ARGV[0]
token = ARGV[1]

Octokit.configure do |c|
  c.api_endpoint = "https://github.com/api/v3/"
end

Octokit.auto_paginate = true
client = Octokit::Client.new(:access_token => token)


for org in client.all_organizations()
   if !client.org_member?(org.login, username)
      puts "#{org.login}"
   end
end
