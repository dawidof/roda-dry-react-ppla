# frozen_string_literal: true
Sequel.migration do
  change do
    create_table(:courses) do
      primary_key :id

      String :name, null: false
      String :url, null: false

      DateTime :created_at, null: false
      DateTime :updated_at, null: false

      unique :name
      index :url, unique: true
    end
  end
end
