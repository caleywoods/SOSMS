# We're globbing the controllers/ dir to snag each of
# our controllers. We gain the ability to then logically
# break each set of routes out into controllers
Dir.glob("controllers/*.rb").each { |r| require_relative r }
require './models/contact'
require 'bundler'
require 'digest/sha1'
require 'rack-flash'
Bundler.require

#config stuffs
DataMapper.setup(:default, "sqlite3:///#{Dir.pwd}/db/sosms.db")
DataMapper.auto_migrate!

use Rack::Session::Cookie
use Rack::Flash
#DMUserTable.cabinet_path = "#{Dir.pwd}/db/users.db"

class Sosms < Sinatra::Base; end;

class Sosms
  CALLER_ID = '4155992671'
  # This will fail if you don't rename config/config.yml.example!
  config = YAML.load_file('./config/config.yml')

  get '/' do
    haml :index
  end
end
