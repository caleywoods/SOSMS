class IncomingController < ApplicationController
  def text
    @user = User.find_by_phone_number(params[:phone_number])
    @user.contacts.each {|contact| contact.notify}
  end

  def call
    builder :call
  end
end
