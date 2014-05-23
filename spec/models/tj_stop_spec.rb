require 'spec_helper'

describe TjStop do

  before { @stop = TjStop.new(name: "GOR Sumantri", google_lookup: "GOR Sumantri stop, Jakarta") }

  subject { @stop }

  it { should respond_to(:name) }
  it { should respond_to(:google_lookup) }
  it { should respond_to(:latitude) }
  it { should respond_to(:longitude) }

  it { should be_valid }

  describe "when google_lookup is not present" do
    before { @stop.google_lookup = " " }
    it { should_not be_valid }
  end

  context "after save" do
    before { @stop.save }
    its(:longitude) { should_not be_nil }
    its(:latitude) { should_not be_nil }
  end
end
