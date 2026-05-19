require 'digest'

# 1. Arqumentlərin sayını yoxlayırıq
if ARGV.length != 2
  puts "Usage: 10-password_cracked.rb HASHED_PASSWORD DICTIONARY_FILE"
  exit
end

target_hash = ARGV[0].downcase.strip
dictionary_path = ARGV[1]

# Lüğət faylının mövcudluğunu yoxlayırıq
unless File.exist?(dictionary_path)
  puts "Error: Dictionary file not found."
  exit
end

password_found = nil

# 2. Lüğəti sətir-sətir oxuyub heşləri müqayisə edirik
File.foreach(dictionary_path) do |line|
  word = line.strip # Sətir sonundakı boşluq və yeni sətir (\n) simvollarını təmizləyirik
  next if word.empty?

  # Sözün SHA-256 heşini hesablayırıq
  current_hash = Digest::SHA256.hexdigest(word)

  if current_hash == target_hash
    password_found = word
    break
  end
end

# 3. Nəticəni ekrana çıxarırıq
if password_found
  puts "Password found: #{password_found}"
else
  puts "Password not found in dictionary."
end
