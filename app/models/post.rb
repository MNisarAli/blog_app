class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { integer_only: true, greater_than_or_equal_to: 0 }

  # Return the 5 most recent comments for a given post
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  after_save :update_posts_counter

  private

  # Update the posts counter for a given user
  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end
end
