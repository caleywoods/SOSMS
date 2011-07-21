class ContactsController < ApplicationController

  before_filter :authenticate_user!

  def new
    @contact = Contact.new

    respond_to do |format|
      format.html #new.haml
    end
  end

  def create
    @contact = Contact.new(params[:contact])
    @user = current_user

    respond_to do |format|
      if @contact.save!
        format.html { redirect_to(@contact, flash[:notice] => "Contact saved!") }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def show
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html #show.haml
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end
end
