class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates :author_id, uniqueness: { scope: :post_id }

  after_save :update_likes_counter

  private

  # Update the likes counter for a post
  def update_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
