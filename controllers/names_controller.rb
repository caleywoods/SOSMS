require 'bundler'
Bundler.require

class Sosms < Sinatra::Base; end;

class Sosms

  # Just a placeholder for now to
  # get something into the controllers
  # dir
  get '/names' do
    haml :names
  end

end
