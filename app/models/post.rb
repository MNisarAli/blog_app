class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # Update the posts counter for a given user
  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end
end
