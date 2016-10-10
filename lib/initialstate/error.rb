module InitialState
  module Error
    class NoAccessKeyError < StandardError
      def initialize(msg='You must set an access key')
        super
      end
    end

    class RequestError < StandardError; end
  end
end
