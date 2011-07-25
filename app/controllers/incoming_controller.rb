class IncomingController < ApplicationController
  BASE_URL = 'http://582dc2b5.dotcloud.com/'

  def text
    @user = User.find_by_phone_number(params[:from])
    @user.contacts.each {|contact| contact.notify}

    render :xml => "<Response />"
  end

  def call
    render :xml => {:say => "Hello, you got it"}.to_xml
  end
end
