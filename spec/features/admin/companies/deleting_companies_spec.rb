require 'rails_helper'

RSpec.feature "User can delete a company" do
  before do
    login_as(FactoryGirl.create(:user, :admin))
  end

  let(:admin) { FactoryGirl.create(:user) }

  scenario "successfully" do
    FactoryGirl.create(:company, name: "MJM Enterprises", admin: admin)

    visit "/companies"
    click_link "MJM Enterprises"
    click_link "Delete Company"

    expect(page).to have_content "Company has been deleted."
    expect(page.current_url).to eq companies_url
    expect(page).to have_no_content "MJM Enterprises"
  end

end