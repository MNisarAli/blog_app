class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # Return the 5 most recent comments for a given post
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  # Update the posts counter for a given user
  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end
end
