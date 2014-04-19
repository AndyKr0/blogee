class Comment < ActiveRecord::Base
    validates :author, :content, presence: true

end