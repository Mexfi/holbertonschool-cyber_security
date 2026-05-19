require 'net/http'
require 'uri'

def get_request(url)
  # 1. URL mətnini URI obyektinə çeviririk
  uri = URI.parse(url)

  # 2. HTTP GET sorğusunu göndəririk və cavabı (response) alırıq
  response = Net::HTTP.get_response(uri)

  # 3. Status kodunu və mesajını tapşırıqdakı formatda çap edirik
  puts "Response status: #{response.code} #{response.message}"

  # 4. Cavabın gövdəsini (body) ekrana çıxarırıq
  puts "Response body:"
  puts response.body
end
