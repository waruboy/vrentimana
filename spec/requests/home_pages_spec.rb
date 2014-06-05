require 'spec_helper'

describe "HomePage" do

  subject { page }
  describe "HomePage" do
    before { visit '/' }
    it { should have_content('Brentimana') }
  end

  describe "search" do

    before { visit '/' }

    let(:search) {"Cari"}

    describe "with valid information" do
      before do
        fill_in "q",     with: "Taman Rasuna"
      end

      it "should create a query" do
        expect { click_button search }.to change(Query, :count).by(1)
      end
    end

  end
end
