require 'net/http'
require 'uri'
require 'json'

def post_request(url, body_params = {})
  uri = URI.parse(url)

  # 1. POST sorğusu obyektini yaradırıq
  request = Net::HTTP::Post.new(uri)
  
  # 2. Başlıqları təyin edirik (Məlumatın JSON olduğunu bildirmək üçün)
  request['Content-Type'] = 'application/json'
  
  # 3. Parametrləri JSON mətninə çevirib sorğunun daxilinə (body) qoyuruq
  request.body = body_params.to_json

  # 4. HTTP bağlantısını qurub sorğunu göndəririk
  response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
    http.request(request)
  end

  # 5. Nəticələri çap edirik
  puts "Response status: #{response.code} #{response.message}"
  puts "Response body:"

  parsed_body = JSON.parse(response.body)
  puts JSON.pretty_generate(parsed_body)
end
