class IncomingController < ApplicationController
  BASE_URL = 'http://582dc2b5.dotcloud.com/'

  def text
    @user = User.find_by_phone_number(params[:from])
    @user.contacts.each {|contact| contact.notify}

    render :xml => "<Response />"
  end

  def call
    @call = BASE_URL + '/call.xml'
    respond_to do |format|
      format.xml { @call }
    end
  end
end
