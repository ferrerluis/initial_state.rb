require 'initialstate/error'
require 'initialstate/default'
require 'initialstate/config'

module InitialState
  class Bucket
    ENDPOINT = '/events'
    URI = InitialState::Default::BASE_URI + ENDPOINT

    attr_reader :bucket_key, :access_key

    def initialize(bucket_key, access_key=nil)
      @bucket_key = bucket_key
      @access_key ||= InitialState::Config.access_key
    end

    def dump(*pairs)
      data = {
        body: pairs,
        headers: {
          'X-IS-AccessKey' => access_key,
          'X-IS-BucketKey' => bucket_key
        }
      }

      res = HTTParty.post(URI, data)
      raise InitialState::Error::RequestError, res.message if res.code/100 != 2
      res.body
    end
  end
end
