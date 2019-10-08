class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string "level"
      t.string "email"
      t.string "name"
      t.string "password_digest"
      t.string "ed_level"
      t.string "university"
      t.integer "max_books"
      t.integer "library_id"
      t.string "google_token"
      t.string "google_refresh_token"

      t.timestamps
    end
  end
end
