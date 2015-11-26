ROM::SQL.migration do
  change do
    create_table :users do
      primary_key :id
      column :name, String, null: false
      column :email, String, null: false, unique: true
      column :role, String, null: false, default: "member"
      column :github_uid, String, unique: true
      column :avatar_url, String
      column :created_at, DateTime
      column :updated_at, DateTime
    end
  end
end
