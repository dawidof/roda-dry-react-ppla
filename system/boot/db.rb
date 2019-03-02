# frozen_string_literal: true

RodaDryReactPpla::Container.boot :db, namespace: true do |system|
  init do
    require 'sequel'
    require 'rom'
    require 'rom/sql'

    use :monitor, :settings

    ROM::SQL.load_extensions :postgres

    Sequel.database_timezone = :utc
    Sequel.application_timezone = :local

    rom_config = ROM::Configuration.new(
      :sql,
      system[:settings].database_url,
      extensions: %i[error_sql pg_array pg_json]
    )

    rom_config.plugin :sql, relations: :instrumentation do |plugin_config|
      plugin_config.notifications = notifications
    end

    rom_config.plugin :sql, relations: :auto_restrictions

    register 'config', rom_config
    register 'connection', rom_config.gateways[:default].connection
  end

  start do
    config = container['db.config']
    config.auto_registration system.root.join('app/db')

    register 'rom', ROM.container(config)
  end
end