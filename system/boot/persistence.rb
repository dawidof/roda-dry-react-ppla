RodaDryReactPpla::Container.boot :persistence, namespace: true do |system|
  init do
    require "sequel"
    # require "rom"
    # require "rom/sql"

    use :monitor, :settings

    # ROM::SQL.load_extensions :postgres

    Sequel.database_timezone = :utc
    Sequel.application_timezone = :local

    # rom_config = ROM::Configuration.new(
    #   :sql,
    #   system[:settings].database_url,
    #   extensions: %i[error_sql pg_array pg_json],
    # )

    # rom_config.plugin :sql, relations: :instrumentation do |plugin_config|
    #   plugin_config.notifications = notifications
    # end

    # rom_config.plugin :sql, relations: :auto_restrictions

    # register "config", rom_config
    # register "db", rom_config.gateways[:default].connection

    sequel_config = system[:settings].database_url
    register "config", system[:settings].database_url
  end

  start do
    Sequel::Model.plugin :auto_validations
    Sequel::Model.plugin :prepared_statements

    register "db", Sequel.connect(container["persistence.config"])
    # container["persistence.db"].extension(:constraint_validations)
    # db.extension(:constraint_validations)
    # Dir.glob('models/*').each {|f| require("./#{f}") }
    # config = container["persistence.config"]
    # config.auto_registration system.root.join("lib/persistence")

    # register "rom", ROM.container(config)
  end

  stop do
    db.close_connection
  end
end
