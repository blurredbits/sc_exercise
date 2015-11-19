require 'rails_helper'

RSpec.feature "User can create a new company" do
  let(:user) { FactoryGirl.create(:user, :admin) }

  before do
    login_as(user)
    visit '/companies'
    click_link "New Company"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "MJM Enterprises"
    click_button "Create Company"
    expect(page).to have_content "Company has been created."
  end

  scenario "with invalid attributes" do
    fill_in "Name", with: ""
    click_button "Create Company"
    expect(page).to have_content "Company has not been created."
  end
end