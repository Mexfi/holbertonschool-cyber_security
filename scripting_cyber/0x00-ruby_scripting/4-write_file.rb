require 'json'

def merge_json_files(file1_path, file2_path)
  # 1. Hər iki faylı oxuyuruq və JSON olaraq parse edirik
  # Əgər fayllardan biri yoxdursa və ya boşdursa, boş massiv [] qəbul edirik
  data1 = File.exist?(file1_path) ? JSON.parse(File.read(file1_path)) : []
  data2 = File.exist?(file2_path) ? JSON.parse(File.read(file2_path)) : []

  # 2. İki massivi bir-biri ilə birləşdiririk (data1-dəki elementləri data2-yə əlavə edirik)
  merged_data = data2 + data1

  # 3. Birləşmiş yeni datanı səliqəli (pretty) formatda yenidən file2_path-ə yazırıq
  File.open(file2_path, 'w') do |f|
    f.write(JSON.pretty_generate(merged_data))
  end
end
