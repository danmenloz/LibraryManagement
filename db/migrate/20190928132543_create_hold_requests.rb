class CreateHoldRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :hold_requests do |t|
      t.integer "copy"
      t.string "status"
      t.float "overdue_fine"
      t.datetime "checkout_date"
      t.datetime "return_date"

      t.references :user
      t.references :book

      t.timestamps
    end
  end
end
