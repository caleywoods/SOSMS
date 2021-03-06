class ContactsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @user = current_user
    @contacts = @user.contacts
  end

  def new
    @contact = Contact.new

    respond_to do |format|
      format.html #new.haml
    end
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.user_id = current_user.id

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

  def update
    @contact = Contact.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to(contacts_path, :notice => 'Contact updated!') }
      else
        format.html { render :action => 'edit' }
      end
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to(contacts_path) }
    end
  end
end
