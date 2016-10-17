module InitialState
  module Default
    BASE_URI = 'https://groker.initialstate.com/api'.freeze

    class << self
      def access_key
        ENV['INITIAL_STATE_ACCESS_KEY']
      end
    end
  end
end
