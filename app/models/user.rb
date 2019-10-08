class User < ApplicationRecord
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  #has_many :hold_requests, dependent: :destroy

  validates :level, presence: true, inclusion: { in: ["admin", "librarian", "student"] }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :name, presence: true, length: { maximum: 100 }
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }
  validates :ed_level, presence: true, if: :is_student?, inclusion: { in: ["Undergraduate", "Masters", "Doctoral"] }
  validates :university, presence: true, if: :is_student?
  validates :max_books, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }, if: :is_student?
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

  def self.from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    where(email: auth.info.email).first_or_initialize do |user|
      user.level = "student"
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = "12345678"
      user.ed_level = "Undergraduate"
      user.university = "N/A"
      user.max_books = 2
    end
    return user
  end
end
