require 'rails_helper'

RSpec.feature "User can edit company" do

  let(:admin) { FactoryGirl.create(:user) }

  before do
    FactoryGirl.create(:company, admin: admin, name: "MJM Enterprises")

    visit "/companies"
    click_link "MJM Enterprises"
    click_link "Edit Company"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "MUM"
    click_button "Update Company"

    expect(page).to have_content "Company has been updated."
    expect(page).to have_content "MUM"
  end

  scenario "with invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Company"

    expect(page).to have_content "Company has not been updated."
  end

end