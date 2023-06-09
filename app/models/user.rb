class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  # Returns the 3 most recent posts for a given user
  def recent_posts
    posts.includes(:comments).order(created_at: :desc).limit(3)
  end
end
