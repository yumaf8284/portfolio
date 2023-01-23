class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :password,    length: { in: 6..15 } 
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
    validates :name, length: { maximum: 15 }
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

    has_secure_password

    has_many :topics

    has_many :comments
    has_many :comment_topics, through: :comments, source: 'topic'
    has_many :favorites, dependent: :destroy
end
