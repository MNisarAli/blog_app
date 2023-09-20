class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  # Return the 3 most recent posts for a given user
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
