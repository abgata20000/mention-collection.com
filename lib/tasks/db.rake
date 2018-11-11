# frozen_string_literal: true

namespace :db do
  desc "Run RAILS_ENV=#{Rails.env} ridgepole, annotate"
  task :ridgepole do
    schema_file = "db/Schemafile"
    if Rails.env.development?
      lines = []
      Dir.glob(Rails.root.join("db", "schema", "*.rb")) do |file|
        basename = File.basename(file)
        lines << "require \"schema/#{basename}\""
      end
      lines.sort!
      File.open(Rails.root.join(schema_file), "w") do |f|
        f.puts(lines.join("\n"))
      end
    end
    sh "bundle exec ridgepole -c config/database.yml -E #{Rails.env} --apply -f #{schema_file}"
    sh "rails db:schema:dump" if Rails.env.development?
    sh "rails annotate_models annotate_routes" if Rails.env.development?
  end

  desc "Run RAILS_ENV=#{Rails.env} ridgepole for heroku"
  task :heroku do
    schema_file = "db/Schemafile"
    sh "bundle exec ridgepole -c config/database.for.heroku.ridgepole.yml -E #{Rails.env} --apply -f #{schema_file}"
  end
end
