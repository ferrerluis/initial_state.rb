module InitialState
  class Event
    attr_reader :key, :value, :epoch, :iso

    def initialize(key, value, epoch=nil, iso=nil)
      @key = key
      @value = value
      @epoch = epoch
      @iso = iso
    end

    def push(bucket_key, access_key=nil)
      bucket = Bucket.new(bucket_key, access_key)
      bucket.dump(self)
    end

    def to_hash
      data = {
        key: key,
        value: value
      }
      data[:epoch] = epoch unless epoch.nil?
      data[:iso] = iso unless iso.nil?
      data
    end
  end
end
