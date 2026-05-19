require 'net/http'
require 'uri'
require 'json'

def post_request(url, body_params = {})
  uri = URI.parse(url)

  request = Net::HTTP::Post.new(uri)
  request['Content-Type'] = 'application/json'
  request.body = body_params.to_json

  response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
    http.request(request)
  end

  puts "Response status: #{response.code} #{response.message}"
  puts "Response body:"

  parsed_body = JSON.parse(response.body)

  # Əgər gələn JSON boşdursa (yəni {}), yan-yana bitişik çap edirik
  if parsed_body.empty?
    puts "{}"
  else
    # Əgər doludursa, önbəön verilən o gözəl nizamı (pretty) qoruyuruq
    puts JSON.pretty_generate(parsed_body)
  end
end
