class Book < ApplicationRecord
  has_one_attached :cover # required to handle images
  belongs_to :library

  validates :isbn, :title, :author, :language, :published, :edition,
            :subject, :summary, :copies, :library_id, presence:true
  validates :isbn, :uniqueness => true
  validates :edition, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :copies, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cover, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..5.megabytes }\

  def requested_by(user)
    HoldRequest.where(book_id: self.id, user_id: user.id).ids.any?
  end
end
