def connection
  RodaDryReactPpla::Container["persistence.db"]
end

def settings
  RodaDryReactPpla::Container["settings"]
end

def database_uri
  require "uri"
  URI.parse(settings.database_url)
end

def postgres_env_vars(uri)
  {}.tap do |vars|
    vars["PGHOST"] = uri.host.to_s
    vars["PGPORT"] = uri.port.to_s if uri.port
    vars["PGUSER"] = uri.user.to_s if uri.user
    vars["PGPASSWORD"] = uri.password.to_s if uri.password
  end
end

namespace :db do
  task :setup do
    RodaDryReactPpla::Container.init :persistence
  end

  desc "Print current database schema version"
  task version: :setup do
    version =
      if connection.tables.include?(:schema_migrations)
        connection[:schema_migrations].order(:filename).last&.fetch(:filename) || 'no migrations'
      else
        "not available"
      end

    puts "Current schema version: #{version}"
  end

  desc "Create database"
  task :create do
    if system("which createdb", out: File::NULL)
      uri = database_uri
      system(postgres_env_vars(uri), "createdb #{Shellwords.escape(uri.path[1..-1])}")
    else
      puts "You must have Postgres installed to create a database"
      exit 1
    end
  end

  desc "Drop database"
  task :drop do
    if system("which dropdb", out: File::NULL)
      uri = database_uri
      system(postgres_env_vars(uri), "dropdb #{Shellwords.escape(uri.path[1..-1])}")
    else
      puts "You must have Postgres installed to drop a database"
      exit 1
    end
  end

  desc "Migrate database up to latest migration available"
  task :migrate do
    # Enhance the migration task provided by ROM
    # Once it finishes, dump the db structure
    Rake::Task["db:structure:dump"].execute

    # And print the current migration version
    Rake::Task["db:version"].execute
  end

  namespace :structure do
    desc "Dump database structure to db/structure.sql"
    task :dump do
      if system("which pg_dump", out: File::NULL)
        uri = database_uri
        system(postgres_env_vars(uri), "pg_dump -s -x -O #{Shellwords.escape(uri.path[1..-1])}", out: "db/structure.sql")
      else
        puts "You must have pg_dump installed to dump the database structure"
      end
    end
  end

  desc "Load seed data into the database"
  task :seed do
    seed_data = File.join("db", "seed.rb")
    load(seed_data) if File.exist?(seed_data)
  end

  desc "Load a small, representative set of data so that the application can start in a useful state (for development)."
  task :sample_data do
    sample_data = File.join("db", "sample_data.rb")
    load(sample_data) if File.exist?(sample_data)
  end

  desc "Rollback the database N steps " \
       "(you can specify the version with `db:rollback[N]`)"
  task :rollback, [:step] do |_task, args|
    step = args[:step] ? Integer(args[:step]) : 1
    version = 0

    target_migration =
      connection[:schema_migrations]
        .reverse_order(:filename)
        .offset(step)
        .first
    if target_migration
      version = Integer(target_migration[:filename].match(/([\d]+)/)[0])
    end

    ROM::SQL::RakeSupport.run_migrations(target: version)
    Rake::Task["db:structure:dump"].execute
    puts "Rolled back to version: #{version}"
  end

  desc "Undo all migrations and migrate again"
  task :remigrate do
    ROM::SQL::RakeSupport.run_migrations(target: 0)
    ROM::SQL::RakeSupport.run_migrations
    Rake::Task["db:structure:dump"].execute
    puts "Remigration complete"
  end
end
