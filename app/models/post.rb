class Post < ActiveRecord::Base
  validates :title, :content, :author, presence: true
  has_many :comments
end
