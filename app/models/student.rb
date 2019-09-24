class Student < ActiveRecord::Base
  has_many :hold_requests

  validates :email, presence : true, uniqueness : { case_sensitive : false }
  validates :name, presence : true
  validates :password, presence : true
  validates :ed_level, presence : true
  validates :university, presence : true
  validates :max_books, presence : true
end
