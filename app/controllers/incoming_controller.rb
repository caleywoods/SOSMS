class IncomingController < ApplicationController
  BASE_URL = 'http://582dc2b5.dotcloud.com/'

  def text
    @user = User.find_by_phone_number(params[:From][1..-1])
    @user.contacts.each {|contact| contact.notify}

    render :xml => {:sms => "Message received, contacts notified. Be safe!"}.to_xml(:root => 'Response')
  end

  def call
    @user = User.find_by_phone_number(params[:From][1..-1])
    @user.contacts.each {|contact| contact.notify}

    render :xml => {:say => "Hello, you got it"}.to_xml(:root => 'Response')
  end
end
