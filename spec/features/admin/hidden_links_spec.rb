require "rails_helper"

RSpec.feature "Users can only see the appropriate links" do

  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:company) { FactoryGirl.create(:company, admin: admin) }

  context "anonymous users" do
    scenario "cannot see the New Company link" do
      visit "/companies"
      expect(page).not_to have_link "New Company"
    end

    scenario "cannot see the Delete Company link" do
      visit company_path(company)
      expect(page).not_to have_link "Delete Company"
    end
  end

  context "regular users" do
    before { login_as(user) }

    scenario "cannot see the New Company link" do
      visit "/companies"
      expect(page).not_to have_link "New Company"
    end

    scenario "cannot see the Delete Company link" do
      visit company_path(company)
      expect(page).not_to have_link "Delete Company"
    end
  end

  context "admin users" do
    before { login_as(admin) }

    scenario "can see the New Company link" do
      visit "/companies"
      expect(page).to have_link "New Company"
    end

    scenario "cannot see the Delete Company link" do
      visit company_path(company)
      expect(page).to have_link "Delete Company"
    end
  end
end