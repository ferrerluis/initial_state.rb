module InitialState
  class Event
    attr_reader :key, :value, :epoch, :iso

    def initialize(key, value, epoch=nil, iso=nil)
      @key = key
      @value = value
      @epoch = epoch
      @iso = iso
    end

    def to_hash
      data = {
        key: key,
        value: value
      }
      data[:epoch] = epoch unless epoch.nil?
      data[:iso] = iso unless iso.nil?
    end
  end
end
