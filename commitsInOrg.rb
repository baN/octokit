require 'octokit'

#Usage example: ruby commitsInOrg.rb infrastructure-sandbox github_token '2018-04-16'
if ARGV.length < 3
  puts "Usage: ruby commitsInOrg.rb <name of github organization> <github token> <since yyyy-mm-dd>"
  exit
end
org = ARGV[0]
github_token = ARGV[1]
since_date = ARGV[2]

Octokit.configure do |c|
  c.api_endpoint = "https://github.com/api/v3/"
end

Octokit.auto_paginate = true

client = Octokit::Client.new(:access_token => github_token)



commit_count_total = 0
commits_per_repo = 0
for repo in client.org_repos(org) #loop through the repos in the org
  #puts "Repository === #{repo.name}"
  listOfBranches = client.branches(repo.id) #get all the branches for the repo

  for branch in listOfBranches #loop through all the branches
    #puts "Branch name: #{branch.name}"
    repo_commits = client.commits_since(repo.id, since_date, branch.name)


    for commits in repo_commits #loop through the commits
      commits_per_repo = commits_per_repo + 1
    end
  end


  #puts "Commit count for #{repo.name}: #{commits_per_repo}"
  commit_count_total = commit_count_total + commits_per_repo #save the total
  commits_per_repo = 0
end

puts "#{org}: #{commit_count_total}"
