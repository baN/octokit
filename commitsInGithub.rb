require 'octokit'

if ARGV.length < 3
  puts "Usage: ruby commitsInOrg.rb <name of github organization> <github token> <since yyyy-mm-dd>"
  exit
end
