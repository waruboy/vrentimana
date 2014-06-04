require 'spec_helper'

describe Corridor do
  before { @corridor = Corridor.new(number: 1) }

  subject { @corridor }

  it { should respond_to(:number) }

  it { should be_valid }

  it { should have_many(:tj_stops)}

  describe "when number is not present" do
    before { @corridor.number = " " }
    it { should_not be_valid }
  end
end
