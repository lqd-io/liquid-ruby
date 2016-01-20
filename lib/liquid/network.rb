class Liquid::Network
  require 'rest_client'

  USER_AGENT = "Liquid/#{Liquid::VERSION} (Ruby ;)"

  def initialize(end_point = nil, token = nil)
    @headers = default_headers
    @end_point = end_point
    change_token token unless token.nil?
  end

  def get(path)
    parse(generic_request(path).get(&handle_error))
  end

  def post(path, params = {})
    parse(generic_request(path).post params, &handle_error)
  end

  def put(path, params = {})
    parse(generic_request(path).put params, &handle_error)
  end

  def delete(path, params = {})
    parse(generic_request(path).delete params, &handle_error)
  end

  def generic_request(path)
    RestClient::Resource.new("#{@end_point}#{path}", headers: @headers)
  end

  def change_token(token)
    @headers['Authorization'] = "Token #{token}"
  end

  def default_headers
    {
      'User-Agent' => USER_AGENT,
      'Accept' => 'application/vnd.lqd.v1+json',
      'Content-Type' => 'application/json',
      'Accept-Encoding' => 'gzip',
      'Authorization' => 'Token '
    }
  end

  private

  def parse(response)
    JSON.parse(response)
  rescue JSON::ParserError
    true
  end

  def handle_error
    proc do |response, request, result, &block|
      if response.code >= 400 && response.code <= 500
        Liquid::ErrorHandler.fail response.code, response
      else
        response.return!(request, result, &block)
      end
    end
  end
end
