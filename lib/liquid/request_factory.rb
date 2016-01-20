# Requests router between analyze and collect
class Liquid::RequestFactory
  COLLECT_ENDPOINT = 'https://api.lqd.io/collect/'
  ANALYZE_ENDPOINT = 'https://analyze.onliquid.com/'

  def initialize(configuration = nil)
    configure configuration unless configuration.nil?
  end

  def configure(configuration)
    @collect_token = configuration.collect_api
    @analyze_token = configuration.analyze_api
    @collect = Liquid::Network.new COLLECT_ENDPOINT, @collect_token
    @analyze = Liquid::Network.new ANALYZE_ENDPOINT, @analyze_token
  end

  def create_data_point(data_point)
    @collect.post 'data_points', data_point
  end

  def make_alias(old_unique_id, new_unique_id)
    payload = { unique_id: new_unique_id, unique_id_alias: old_unique_id }
    @collect.post 'aliases', payload
  end

  def user(unique_id)
    @analyze.get "users/#{unique_id}"
  end
end
