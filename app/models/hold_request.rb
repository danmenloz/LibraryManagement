class HoldRequest < ApplicationRecord
  belongs_to :user
  belongs_to :book

  # validates :book_id ,:user_id, presence:true

  # validates :user_id, presence: true
  # validates :book_id, presence: true
  # validates :state, presence: true, inclusion: { in: ["requested", "approved", "ready", "checked_out", "returned"] }
  # validates :needs_approval, presence: true, inclusion: { in: [true, false] }
  # validates :due_date, presence: true

  def get_book(book_id)
    Book.find(book_id)
  end
end
