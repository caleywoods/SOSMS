require 'bundler'
Bundler.require

class Sosms < Sinatra::Base; end;

class Sosms

  get '/' do
    haml :index
  end

end
