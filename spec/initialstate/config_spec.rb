require 'spec_helper'

RSpec.describe InitialState::Config do
  describe "#access_key" do
    context "before setting up" do
      it "raises error" do
        ENV['INITIAL_STATE_ACCESS_KEY'] = nil
        expect { InitialState::Config.access_key }.to raise_error InitialState::Error::NoAccessKeyError
      end
    end

    context "after setting up" do
      it "is consistent" do
        InitialState::Config.access_key = "abc123"
        expect(InitialState::Config.access_key).to eq "abc123"
      end
    end
  end
end
