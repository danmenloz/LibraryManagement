class Librarian < ActiveRecord::Base
  belongs_to :library

  validates :email, presence : true, uniqueness : { case_sensitive : false }
  validates :name, presence : true
  validates :password, presence : true
  validates :library_id, presence : true
end
