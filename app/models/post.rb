class Post< ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :language, presence: true
  validates :primary_contributers, presence: true
end
