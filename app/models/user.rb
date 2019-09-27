class User < ApplicationRecord
  has_many :hold_requests, :dependent => :delete_all
  belongs_to :library

  validates :type, presence : true, inclusion: { in: ["admin", "librarian", "student"] }
  validates :email, presence : true, uniqueness : { case_sensitive : false }
  validates :name, presence : true
  has_secure_password
  validates :password, presence : true
  validates :ed_level, presence : true, if: :is_student?, inclusion: { in: ["Undergraduate", "Masters", "Doctoral"] }
  validates :university, presence : true, if: :is_student?
  validates :max_books, presence : true, if: :is_student?
  validates :library_id, presence : true, if: :is_librarian?

  def is_admin?
    type == "admin"
  end

  def is_librarian?
    type == "librarian"
  end

  def is_student?
    type == "student"
  end
end
