class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates :text, presence: true

  after_save :update_comments_counter

  private

  # Update the comments counter for a post
  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
