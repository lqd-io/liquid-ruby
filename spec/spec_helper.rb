$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'liquid'

require 'webmock/rspec'
require 'vcr'

VCR.configure do |c|
  c.allow_http_connections_when_no_cassette = false
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
end

RSpec.configure do |config|
  config.raise_errors_for_deprecations!
  config.run_all_when_everything_filtered = true
  config.filter_run focus: true
  config.order = 'random'

  Dir['./spec/shared/**/*.rb'].each { |f| require f }
end
