require 'spec_helper'

RSpec.describe InitialState::Bucket do
  let(:access_key) { ENV['INITIAL_STATE_ACCESS_KEY'] }
  let(:bucket_key) { ENV['INITIAL_STATE_BUCKET_KEY'] }

  describe '#new' do
    context 'using default access_key from environment' do
      it 'does not raise errors' do
        expect { InitialState::Bucket.new bucket_key }.not_to raise_error
      end

      it 'is a Bucket' do
        expect(InitialState::Bucket.new bucket_key).to be_a InitialState::Bucket
      end
    end

    context 'after setting up access_key' do
      it 'raises error' do
        InitialState::Config.access_key = 'key123'
        expect(InitialState::Bucket.new bucket_key).to be_a InitialState::Bucket
      end
    end

    context 'before setting up access_key' do
      it 'raises error' do
        ENV['INITIAL_STATE_ACCESS_KEY'] = nil
        InitialState::Config.access_key = nil
        expect{ InitialState::Bucket.new bucket_key }.to raise_error InitialState::Error::NoAccessKeyError
      end
    end
  end
end
