require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:example) do
    @user = User.create(name: 'John Doe', photo: 'User photo', bio: 'User bio', posts_counter: 0)
    @post = Post.create(title: 'title', text: 'content', author: @user, comments_counter: 0, likes_counter: 0)
  end

  describe 'validations' do
    it 'is valid with a title and text' do
      expect(@post).to be_valid
    end

    it 'is invalid without a title' do
      @post.title = nil
      expect(@post).to_not be_valid
    end
  end

  describe '#recent_comments' do
    it 'returns the 5 most recent comments on the post' do
      comment1 = Comment.create(text: 'comment 1', post: @post, author: @user, created_at: 1.day.ago)
      comment2 = Comment.create(text: 'comment 2', post: @post, author: @user, created_at: 2.days.ago)
      comment3 = Comment.create(text: 'comment 3', post: @post, author: @user, created_at: 3.days.ago)
      comment4 = Comment.create(text: 'comment 4', post: @post, author: @user, created_at: 4.days.ago)
      comment5 = Comment.create(text: 'comment 5', post: @post, author: @user, created_at: 5.days.ago)
      comment6 = Comment.create(text: 'comment 6', post: @post, author: @user, created_at: 6.days.ago)

      expect(@post.recent_comments).to eq([comment1, comment2, comment3, comment4, comment5])
      expect(@post.recent_comments).to_not include(comment6)
    end

    it 'returns an empty array if the post has no comments' do
      @post.comments.destroy_all

      expect(@post.recent_comments).to eq([])
    end
  end
end
