class IncomingController < ApplicationController
  BASE_URL = 'http://582dc2b5.dotcloud.com/'

  def text
    @user = User.find_by_phone_number(params[:from])
    @user.contacts.each {|contact| contact.notify}

    render :xml => {:sms => "Message received, contacts notified. Be safe!"}.to_xml
  end

  def call
    @user = User.find_by_phone_number(params[:From])
    @user.contacts.each {|contact| contact.notify}

    render :xml => {:say => "Hello, you got it"}.to_xml
  end
end
