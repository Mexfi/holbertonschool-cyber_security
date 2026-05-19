require 'open-uri'
require 'uri'
require 'fileutils'

# 1. Arqumentlərin sayını yoxlayırıq. 2 arqument olmalıdır (URL və Path)
if ARGV.length != 2
  puts "Usage: 9-download_file.rb URL LOCAL_FILE_PATH"
  exit
end

url = ARGV[0]
local_path = ARGV[1]

begin
  # 2. Endirmə bildirişini çap edirik
  puts "Downloading file from #{url}..."

  # 3. Faylı təhlükəsiz şəkildə endiririk və yerli diskə qeyd edirik
  URI.open(url) do |remote_file|
    # Əgər hədəf qovluq mövcud deyilsə, fileutils vasitəsilə yaradırıq
    dir = File.dirname(local_path)
    FileUtils.mkdir_p(dir) unless File.directory?(dir)

    # Faylı binar (yazma) rejimində açırıq və içini doldururuq
    File.open(local_path, 'wb') do |local_file|
      local_file.write(remote_file.read)
    end
  end

  # 4. Uğurlu endirmə bildirişi
  puts "File downloaded and saved to #{local_path}."

rescue StandardError => e
  # Hər hansı şəbəkə və ya fayl xətası baş verərsə tutmaq üçün
  puts "An error occurred: #{e.message}"
end
