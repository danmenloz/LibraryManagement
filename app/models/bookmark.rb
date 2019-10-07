class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :book_id ,:user_id, presence:true
end
