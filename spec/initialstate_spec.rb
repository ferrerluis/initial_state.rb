require 'initialstate'

RSpec.describe InitialState::Config, "#access_key" do
  context "before set up" do
    it "raises error" do
      ENV['INITIAL_STATE_ACCESS_KEY'] = nil
      expect { InitialState::Config.access_key }.to raise_error InitialState::Error::NoAccessKeyError
    end
  end

  context "after set up" do
    it "is consistent" do
      InitialState::Config.access_key = "abc123"
      expect(InitialState::Config.access_key).to eq "abc123"
    end
  end
end

RSpec.describe InitialState::Bucket, "#new" do
  context "before set up access_key" do
    it "raises error" do
      ENV['INITIAL_STATE_ACCESS_KEY'] = nil
      InitialState::Config.access_key = nil
      expect{ InitialState::Bucket.new ENV['INITIAL_STATE_BUCKET_KEY'] }.to raise_error InitialState::Error::NoAccessKeyError
    end
  end
  # context "after set up access_key" do
  #   it "raises error" do
  #     InitialState::Config.instance.access_key = ENV['INITIAL_STATE_ACCESS_KEY']
  #     expect(InitialState::Bucket.new ENV['INITIAL_STATE_BUCKET_KEY']).to te_a InitialState::Bucket
  #   end
  # end
end
