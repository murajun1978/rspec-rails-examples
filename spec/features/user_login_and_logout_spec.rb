require 'rails_helper'

feature "User logs in and logs out", :type => :feature do
  
  scenario "successfully" do
    
    user = create(:user, email: "someone@example.tld", password: "somepassword")

    visit "/"

    click_link "Log in"
    expect(current_path).to eq(new_user_session_path)

    fill_in "Email", with: "someone@example.tld"
    fill_in "Password", with: "somepassword"
    click_button "Log in"

    expect(current_path).to eq "/"
    expect(page).to have_content "Signed in successfully."
    expect(page).to have_content "Hello, someone@example.tld"

    click_button "Log out"

    expect(current_path).to eq "/"
    expect(page).to have_content "Signed out successfully."
    expect(page).not_to have_content "someone@example.tld"    

  end

end