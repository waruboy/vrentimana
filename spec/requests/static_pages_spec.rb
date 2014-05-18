require 'spec_helper'

describe "StaticPages" do
  describe "Search Pages" do
    it "should have the content 'Halte terdekat dari'" do
      visit '/search?q=Monumen+Nasional'
      expect(page).to have_content('Halte terdekat dari: Monumen Nasional')
    end
  end
end
