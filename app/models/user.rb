class User < ApplicationRecord
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  has_many :hold_requests, dependent: :destroy
  belongs_to :library

  validates :level, presence: true, inclusion: { in: ["admin", "librarian", "student"] }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX}
  validates :name, presence: true, length: { maximum: 100 }
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }
  validates :ed_level, presence: true, if: :is_student?, inclusion: { in: ["Undergraduate", "Masters", "Doctoral"] }
  validates :university, presence: true, if: :is_student?
  validates :max_books, presence: true, if: :is_student?
  validates :library_id, presence: true, if: :is_librarian?

  def is_admin?
    @level == "admin"
  end

  def is_librarian?
    @level == "librarian"
  end

  def is_student?
    @level == "student"
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
