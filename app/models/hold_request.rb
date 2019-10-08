class HoldRequest < ApplicationRecord
  belongs_to :user
  belongs_to :book


  # validates :book_id ,:user_id, presence:true

  # validates :user_id, presence: true
  # validates :book_id, presence: true
  # validates :state, presence: true, inclusion: { in: ["requested", "approved", "ready", "checked_out", "returned"] }
  # validates :needs_approval, presence: true, inclusion: { in: [true, false] }
  # validates :due_date, presence: true

  # Return the book object from the Hold Request
  def get_book
    Book.find(self.book_id)
  end
end
