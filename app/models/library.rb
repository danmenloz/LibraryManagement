class Library < ActiveRecord::Base
  has_many :books, dependent: :destroy
  # validates_associated :books

  validates :name, :university, :location, :max_days, :overdue_fines , :presence => true
  validates :max_days, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :overdue_fines, numericality: { only_integer: false, greater_than_or_equal_to: 0 }
  validates :name, :uniqueness => { :scope => :university, :message => ": pair (name-university) already exists!" } # the pair :name,:university must be unique

  def Library.get_lib(user)
    self.find(user.library_id).name
  end
end
