require "rails helper"

RSpec.feature "Admins can create new users" do

  let(:admin) { FactoryGirl.create(:user, :admin) }

  before do
    login_as(admin)
    visit "/"
    click_link "Admin"
    click_link "Users"
    click_link "New User"
  end

  scenario "with valid credentials" do
    fill_in "Email", with: "newbie@sc_exercise.com"
    fill_in "Password", with: "password"
    click_button "Create user"
    expect(page).to have_content "User has been created."
  end 
end