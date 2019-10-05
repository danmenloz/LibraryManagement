class Book < ActiveRecord::Base
  has_one_attached :cover # required to handle images
  belongs_to :library

  validates :isbn, :title, :author, :language, :published, :edition,
            :cover, :subject, :summary, :copies, :library_id, presence:true
  validates :isbn, :uniqueness => true
  validates :edition, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :copies, numericality: { only_integer: true, greater_than_or_equal_to: 0 }



end
