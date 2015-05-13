require 'gittop/rating'
require 'yaml'
require 'gittop/version'

module Gittop

  def self.show_stats
    puts 'Enter GitHub accounts (comma separated):'
    input = gets.chomp.strip

    accounts = input.split(',').map(&:strip)

    config = YAML::load_file(File.join(File.dirname(File.expand_path(__FILE__)), '../config/github_credentials.yml'))

    unless config['access_token']
      puts "Please update config/github_credentials.yml file with your GitHub access_token: https://github.com/settings/tokens"
    end
    rating = Rating.new(config['access_token'])

    chart = rating.chart(accounts)
    rating.print_rating(chart)
  rescue Exception => e
    puts "#{e.class.to_s} #{e.message}"
  end
end
