require 'net/http'
require 'uri'
require 'json'

def get_request(url)
  uri = URI.parse(url)
  response = Net::HTTP.get_response(uri)

  puts "Response status: #{response.code} #{response.message}"
  puts "Response body:"
  
  # Body-ni səliqəli (pretty) formata salıb çap edirik ki, alt-alta mötərizə şərtini ödəsin
  parsed_body = JSON.parse(response.body)
  puts JSON.pretty_generate(parsed_body)
end
