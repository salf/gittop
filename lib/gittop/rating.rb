require 'octokit'
require 'gittop/array'

class Rating
  def initialize(token)
    @client = Octokit::Client.new(access_token: token)
    @client.user
  end

  def repos(login)
    user = @client.user login
    user.rels[:repos].get.data
  end

  def commits(login)
    counts = repos(login).async_map do |repo|
      owner_commits(repo)
    end.reduce(:+)
    { account: login, counts: counts }
  end

  def owner_commits(repo)
    stats = @client.participation_stats(repo[:full_name])
    stats.nil? ? 0 : stats[:owner].reduce(:+)
  end

  def chart(logins)
    chart = logins.async_map do |login|
      commits(login)
    end
  end

  def print_rating(chart)
    chart.select!{|k| !k.is_a?(Exception)}
    chart.sort_by!{|k| k[:counts]}.reverse!
    max_length = chart.map{|a| a[:account]}.max_by(&:length).length
    chart.each{|e| printf "%-#{max_length + 4}s %s\n", e[:account], e[:counts] }
  end
end