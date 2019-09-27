class CreateLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :university
      t.string :location
      t.integer :max_days
      t.integer :overdue_fines
      # t.string :caller_locations


      t.timestamps
    end
  end
end
