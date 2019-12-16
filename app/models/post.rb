class Post < ApplicationRecord
has_many :comments
validates :title, :body, presence: true
 self.per_page = 3
end
