module InitialState
  module Version
    ENDPOINT = '/versions'.freeze
    URI = InitialState::Default::BASE_URI + ENDPOINT

    class << self
      def all
        InitialState::Network.get(URI)
      end

      def latest
        all.last
      end
    end
  end
end
