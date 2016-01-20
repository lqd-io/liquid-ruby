require 'net/http'
require 'cgi'
require 'uri'
require 'json'

require 'liquid/version'
require 'liquid/network'
require 'liquid/request_factory'
require 'liquid/configuration'
require 'liquid/errors'

module Liquid
  @configuration = Liquid::Configuration.new
  @network = Liquid::RequestFactory.new

  def self.configure
    if block_given?
      yield @configuration
      @Liquid
      @network.configure @configuration
    end
  end

  # Track an event
  # @param [Hash] user attributes (mandatory fields [unique_id])
  # @param [Hash] event attributes (mandatory fields [date])
  # @param [Hash] device attributes
  def self.track(user, event, device = {})
    date = DateTime.now
    event[:date] = date
    device[:unique_id] ||= "Ruby::#{user[:unique_id]}"
    device[:platform] ||= 'Ruby'
    dp = { user: user, device: device, event: event, timestamp: date }
    @network.create_data_point dp
    true
  end

  # Make alias (merge 2 users)
  # @param [String] old_unique_id of user
  # @param [String] new unique_id of user
  def self.alias(old_unique_id, new_unique_id)
    @network.make_alias old_unique_id, new_unique_id
    true
  end

  # ---------------
  # ANALYZE API
  # ---------------

  # Get User info
  def self.user(unique_id)
    @network.user unique_id
  end
end
