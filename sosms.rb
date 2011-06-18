# We're globbing the controllers/ dir to snag each of
# our controllers. We gain the ability to then logically
# break each set of routes out into controllers
Dir.glob("controllers/*.rb").each { |r| require_relative r }
require 'bundler'
Bundler.require

class Sosms < Sinatra::Base; end;

class Sosms
  # This will fail if you don't rename config/config.yml.example!
  config = YAML.load_file('./config/config.yml')

  get '/' do
    haml :index
  end

end
