class Comment < ActiveRecord::Base
  validates :author, presence: true
  validates :content, presence: true, length: { minimum: 15, message: "must be at least 15 characters long." }
end