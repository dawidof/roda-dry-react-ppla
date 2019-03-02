# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table(:courses) do
      primary_key :id

      column :name, String, null: false
      column :url, String, null: false

      column :created_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
      column :updated_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP

      unique :name
      index :url, unique: true
    end
  end
end
