require 'spec_helper'

describe "organisational email checker", type: :feature do
  before do
    visit 'support/check-organisation-email-address'
  end

  context "with a private email" do
    it "yields no result" do
      fill_in 'Search for eligible organisation emails', with: 'steph@gmail.com'

      expect(page).not_to have_selector('tr.result-row')
    end
  end

  context "with an allowed top-level domain" do
    it "yields results" do
      fill_in 'Search for eligible organisation emails', with: '@gov.uk'

      expect(page).to have_selector('tr.result-row')
    end
  end

  context "with an allowed top-level domain including the identifier" do
    it "yields results" do
      fill_in 'Search for eligible organisation emails', with: 'steph@gov.uk'

      expect(page).to have_selector('tr.result-row')
    end
  end

  context "with an allowed subdomain domain" do
    it "yields results" do
      fill_in 'Search for eligible organisation emails', with: 'steph@french.gov.uk'

      expect(page).to have_selector('tr.result-row')
    end
  end

  context "when there is no value" do
    it "shows all of them" do
      fill_in 'Search for eligible organisation emails', with: ''

      expect(page).to have_selector('tr.result-row')
    end
  end
end
