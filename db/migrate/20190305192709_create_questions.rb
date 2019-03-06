# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table(:questions) do
      primary_key :id

      column :code, String, null: false
      column :title, String, null: false
      column :position, Integer, null: false
      foreign_key :course_id, :courses

      column :created_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
      column :updated_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP

      unique :code
    end
  end
end
