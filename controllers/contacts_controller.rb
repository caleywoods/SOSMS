require 'bundler'
Bundler.require

class Sosms < Sinatra::Base; end;

class Sosms

  # This is the "new" method
  get '/contact/new' do
    haml :"contacts/form"
  end

  # This is the "show" method
  get '/contact/:id' do
    @contact = Contact.first :id => params[:id]
    haml :"contacts/show"
  end

  get '/contact/:id/edit' do
    @contact = Contact.first :id => params[:id]
    haml :"contacts/edit"
  end

  post '/contact/new' do
    #number = params[:phone_number]
    #message = params[:message]
    c = Contact.create(
      :first_name => params[:first_name],
      :last_name => params[:last_name],
      :email=> params[:email],
      :phone_number => params[:phone_number])

    redirect "/contact/#{c.id}"
    #Twilio.connect(config['development']['TWILIO_SID'], config['development']['TWILIO_TKN'])
    #Twilio::Sms.message(CALLER_ID, number, message)
  end
end
