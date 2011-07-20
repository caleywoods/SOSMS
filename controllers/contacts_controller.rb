require 'bundler'
Bundler.require

class Sosms < Sinatra::Base; end;

class Sosms

   get '/contact' do
    haml :form
  end

  get '/contact/:id' do
    @contact = Contact.first :id => params[:id]
    haml :show
  end

  post '/contact' do
    #number = params[:phone_number]
    #message = params[:message]
    c = Contact.create(:first_name => params[:first_name],
                    :last_name => params[:last_name],
                    :email=> params[:email],
                    :phone_number => params[:phone_number])

    redirect "/contact/#{c.id}"
    #Twilio.connect(config['development']['TWILIO_SID'], config['development']['TWILIO_TKN'])
    #Twilio::Sms.message(CALLER_ID, number, message)
  end
end
