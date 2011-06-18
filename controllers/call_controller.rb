require 'bundler'
Bundler.require

class Sosms < Sinatra::Base; end;

class Sosms

  # Takes you to views/call.haml
  #
  # This presents a form that accepts a phone number and
  # a message to send via text.
  get '/call' do
    haml :call
  end

  # When "text me!" is clicked on the call template this route
  # is used.
  #
  # You must first connect to Twilio.
  #  Usage:
  #    Twilio.connect(account_sid, account_token)
  #
  # Add your SID and token into config.yml and it will be loaded and
  # used here.
  #
  # The message is sent with Twilio::Sms.message
  #  Usage:
  #    Twilio::Sms.message(from, to, body, opts = {}) opts is usually
  #    the callback URL.
  #
  # The message is queued with twilio and delivered shortly
  #
  # The user is redirected back to the get '/call' route to send another
  # message.
  post '/call' do
    Twilio.connect(config['development']['TWILIO_SID'], config['development']['TWILIO_TKN'])
    number = params[:phone_number]
    text = params[:text]

    Twilio::Sms.message('your_demo_number', number, text)

    redirect '/call'
  end

end
