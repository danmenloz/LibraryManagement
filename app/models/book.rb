class Book < ActiveRecord::Base
  has_one_attached :cover # required to handle images
  belongs_to :library

  validates :isbn, :title, :author, :language, :published, :edition,
            :cover, :subject, :summary, :copies, :library_id, presence:true
  validates :isbn, :uniqueness => true
  validates :edition, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :copies, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
<<<<<<< HEAD
  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%") || where('isbn LIKE ?', "%#{search}%")
    end
  end
=======

  def self.search(search)
    where("title LIKE ?", "%#{search}%")
  end

>>>>>>> fe7bf1f59bab8ed5235d3fd4cce1ce97a400eea2
end
