require 'spec_helper'

describe Query do
   before { @query = Query.new(text: "Monumen Nasional") }

  subject { @query }

  it { should respond_to(:text) }
  it { should respond_to(:latitude) }
  it { should respond_to(:longitude) }
  it { should be_valid }

end
