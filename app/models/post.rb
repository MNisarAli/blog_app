class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  # Returns the 5 most recent comments for a given post
  def recent_comments
    comments.includes(:author).order(created_at: :desc).limit(5)
  end

  after_save :update_posts_counter

  private

  # Updates the posts counter for a user
  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end
end
