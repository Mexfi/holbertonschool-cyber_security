def print_arguments
  if ARGV.empty?
    puts "No arguments provided."
  else
    # 1. İlk öncə sistemin tələb etdiyi başlığı çap edirik
    puts "Arguments:"
    
    # 2. Sonra hər bir arqumenti nömrələmədən, birbaşa alt-alta yazdırırıq
    ARGV.each do |arg|
      puts arg
    end
  end
end
