class Topic < ApplicationRecord
    validates :user_id, presence: true
    validates :title, presence: true
    validates :body, presence: true

    belongs_to :user

    has_many :comments
    has_many :comment_users, through: :comments, source: 'user'
    has_many :favorites, dependent: :destroy
end
    