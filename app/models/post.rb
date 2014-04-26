class Post < ActiveRecord::Base
  validates :title, :content, :author, presence: true
  has_many :comments, dependent: :delete_all
end
