module InitialState
  module Config
    class << self
      attr_writer :access_key

      def access_key
        @access_key ||= InitialState::Default.access_key
        raise InitialState::Error::NoAccessKeyError if @access_key.nil?
        @access_key
      end
    end
  end
end
