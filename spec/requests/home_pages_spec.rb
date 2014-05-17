require 'spec_helper'

describe "HomePage" do
  it "should have the content 'Brentimana'" do
      visit '/'
      expect(page).to have_content('Brentimana')
    end
end
