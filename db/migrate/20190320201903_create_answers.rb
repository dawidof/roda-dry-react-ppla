ROM::SQL.migration do
  change do
    create_table(:answers) do
      primary_key :id

      column :title, String, null: false
      column :position, Integer, null: false
      column :correct, FalseClass, null: false
      foreign_key :question_id, :questions

      column :created_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
      column :updated_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP

      index :position
    end
  end
end
