require 'net/http'
require 'uri'
require 'json'

def post_request(url, body_params = {})
  # 1. URL mətnini URI obyektinə çeviririk
  uri = URI.parse(url)

  # 2. POST sorğusu obyektini yaradırıq
  request = Net::HTTP::Post.new(uri)
  
  # 3. Form parametrlərini sorğuya mənimsədirik (application/x-www-form-urlencoded formatında)
  request.set_form_data(body_params)

  # 4. HTTP bağlantısı qurub sorğunu göndəririk
  response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
    http.request(request)
  end

  # 5. Status kodunu və mesajını çap edirik
  puts "Response status: #{response.code} #{response.message}"
  puts "Response body:"

  # 6. Gələn cavabı JSON olaraq parse edib, səliqəli (pretty) şəkildə yazdırırıq
  parsed_body = JSON.parse(response.body)
  puts JSON.pretty_generate(parsed_body)
end
