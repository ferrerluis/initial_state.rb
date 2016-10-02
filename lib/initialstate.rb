require 'httparty'

module InitialState
  BASE_URI = 'https://groker.initialstate.com/api'

  class Bucket
    ENDPOINT = '/events'
    URI = BASE_URI + ENDPOINT

    def initialize(access_key, bucket_key)
      @access_key = access_key
      @bucket_key = bucket_key
    end

    def dump(key, value)
      data = {
        body: {
          key => value
        }, headers: {
          'X-IS-AccessKey' => @access_key,
          'X-IS-BucketKey' => @bucket_key
        }
      }
      res = HTTParty.post(URI, data)
      res.code/100 == 2 # Returns true if it goes through. False otherwise.
    end
  end
end
