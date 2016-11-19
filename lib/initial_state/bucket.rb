module InitialState
  class Bucket
    ENDPOINT = '/events'.freeze
    URI = InitialState::Default::BASE_URI + ENDPOINT

    attr_reader :bucket_key, :access_key

    def initialize(bucket_key, access_key=InitialState::Config.access_key)
      @bucket_key = bucket_key
      @access_key = access_key
    end

    def dump(*events)
      post(URI, prepare(events))
    end

    private

    def prepare(events)
      {
        # If events are passed as normal hashes, it will also get sent
        body: events.map { |e| e.respond_to?(:to_hash) ? e.to_hash : e },
        headers: {
          'X-IS-AccessKey' => access_key,
          'X-IS-BucketKey' => bucket_key
        }
      }
    end

    def post(uri, data)
      res = HTTParty.post(uri, data)
      raise InitialState::Error::RequestError, res.message if res.code/100 != 2
      res.body
    end
  end
end
