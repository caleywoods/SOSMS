require 'spec_helper'

describe "AddContacts" do
  it "allows you to add a contact" do
    user    = Factory(:user)
    contact = Factory(:contact)

    # Sign in
    # Can we DRY this up?
    visit new_user_session_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Sign in"

    # Attempt to add a contact
    visit new_contact_path
    fill_in "contact_first_name", :with => contact.first_name
    fill_in "contact_last_name", :with => contact.last_name
    fill_in "contact_email", :with => contact.email
    fill_in "contact_phone_number", :with => contact.phone_number
  end
end
