class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.string :author
      t.string :language
      t.datetime :published
      t.integer :edition
      t.string :cover
      t.string :subject
      t.text :summary
      t.boolean :special
      t.integer :copies

      t.references :library
      t.timestamps
    end
  end
end
