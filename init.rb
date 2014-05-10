require 'twitter'
require 'yaml'
class TwitterClient
  def initialize
    @keys = YAML.load_file(File.join(File.dirname(__FILE__), 'config', 'config.yml'))
  end

  def client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = @keys['api_key']
      config.consumer_secret     = @keys['api_secret']
      config.access_token        = @keys['access_token']
      config.access_token_secret = @keys['access_token_secret']
    end
  end
end
