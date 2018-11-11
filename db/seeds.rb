# frozen_string_literal: true

# 順番を指定して読み込みたいファイルを指定
seed_files = ["user.rb"]

# seedsフォルダを検索して実行するファイルを追加
Dir.glob(File.join(Rails.root, "db", "seeds", "*.rb")) do |file|
  basename = File.basename(file)
  next if seed_files.include?(basename)
  seed_files << basename
end

# SEEDを実行
seed_files.each do |basename|
  file = File.join(Rails.root, "db", "seeds", basename)
  # puts "#{basename} seed creating ..."
  print '.'
  begin
    load(file)
  rescue StandardError => e
    puts ''
    puts "#{basename} seed has error => #{e}"
  end
end

puts ''
