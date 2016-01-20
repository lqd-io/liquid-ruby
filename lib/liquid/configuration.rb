class Liquid::Configuration
  CONFIGURABLE_ATTRIBUTES = %i(collect_api analyze_api)

  attr_accessor *CONFIGURABLE_ATTRIBUTES

  def initialize(attrs = {})
    self.attributes = attrs
  end

  def attributes=(attrs = {})
    attrs.each { |key, value| instance_variable_set("@#{key}", value) }
  end
end
