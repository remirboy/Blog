class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    validates :title, presence: true, length: {minimum: 3}
    validates :content, presence: true, length: {minimum: 10}
end
