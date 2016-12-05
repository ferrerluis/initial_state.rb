# InitialState.rb ![Build status](https://travis-ci.org/ferrerluis/initial_state.rb.svg?branch=master)

The gem `initialstate` is a wrapper library for the public API provided by [Initial State](https://initialstate.com/). As of now, it only allows for the simplest use cases provided by the API: dumping data in a bucket.

## Installation
- Install InitialState.rb: `gem install initial_state`
- OR add to your Gemfile: `gem 'initial_state', '~> 0.0.2'`
- OR clone this repo and build and install the gem for the latest development version (under your own risk)
  - Clone the repo: `git clone https://github.com/ferrerluis/initial_state.rb.git; cd initial_state.rb`
  - Build the gem: `gem build initial_state.gemspec`
  - Install the gem: `gem install ./initial_state-0.0.2.gem`

## Usage
- Require InitialState.rb (skip if adding to Gemfile in Rails): `require 'initial_state'`
- Create an event: `event = Event.new('foo', 'bar')`
- Create a bucket: `bucket = Bucket.new('my_bucket_key', 'my_access_key')`
- Dump the event into the bucket: `bucket.dump(event)`
- PROFIT (jk.)

## API

### Event

#### Creation
`Event.new key, value, epoch=nil, iso8601=nil`

#### Fields
- `key`: stream key name
- `value`: stream value
- `epoch=nil`: in seconds with fractional seconds to right of decimal. Will be used for timestamping if valid. Takes precedence over `iso8601`.
- `iso8601=nil`: ISO-8601 Timestamp. Will be used for timestamping if valid.

#### Functions
- `#push bucket_key, access_key=nil`: Pushes the `Event` into a `Bucket`. Useful when the `Bucket` has not been created and this is the only `Event` that needs to be pushed. `access_key` is accessed through the environment variable `INITIAL_STATE_ACCESS_KEY`, so it does not have to be specified.
- `#to_hash`: Turns the `Event` into a `Hash` that can be easily sent over the wire with any HTTP library in Ruby. By default, InitialState.rb uses HTTParty to send the request when using `Event#push` or `Bucket#dump`, so this method should be rarely used.

### Bucket

#### Creation
`Bucket.new bucket_key, access_key=nil`

#### Fields
- `bucket_key`: associates event data
- `access_key=nil`: API key to authenticate the user. `access_key` is accessed through the environment variable `INITIAL_STATE_ACCESS_KEY`, so it does not have to be specified.

#### Functions
- `#dump *events`: Pushes multiple `Event` objects into the `Bucket`. Events can be added as separate parameters when calling the function or as one array using the syntax `bucket.dump(*events)` to expand the array into a list or arguments.
- `#dump *array_of_hashes`: The same `#dump` function allows for hashes to be passed as arguments when creating `Event` objects is not desirable. e.g. `bucket.dump({key: 'foo', value: 'bar'}, {key: 'bar', value: 'foo', iso8601: '20161012T035640Z'})`
