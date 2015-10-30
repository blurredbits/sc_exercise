require "rails_helper"

RSpec.feature "User can view a company" do
  let(:admin) { FactoryGirl.create(:user) }

  scenario "with the company details" do
    company = FactoryGirl.create(:company, admin: admin, name: "MJM")

    visit "/companies"
    click_link "MJM"
    expect(page.current_url).to eq company_url(company)
  end
end