require 'spec_helper'

describe "SignIns" do
  it "allows you to sign in" do
    user = Factory(:user)

    visit new_user_session_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password

    click_button "Sign in"
  end
end
