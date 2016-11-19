require 'httparty'

module InitialState
  class Network
    class << self
      def post(uri, data)
        res = HTTParty.post(uri, data)
        raise InitialState::Error::RequestError, res.message if res.code/100 != 2
        res
      end
      def get(uri)
        res = HTTParty.get(uri)
        raise InitialState::Error::RequestError, res.message if res.code/100 != 2
        res
      end
    end
  end
end
