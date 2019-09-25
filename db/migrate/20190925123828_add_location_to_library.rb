class AddLocationToLibrary < ActiveRecord::Migration[5.2]
  def change
    add_column :libraries, :location, :string
  end
end
