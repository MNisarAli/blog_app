require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#recent_posts' do
    it 'returns the 3 most recent posts of the user' do
      user = User.create(name: 'John Doe', photo: 'User photo', bio: 'User bio', posts_counter: 0)
      post1 = Post.create(title: 'title1', text: 'content1', author: user, comments_counter: 0, likes_counter: 0,
                          created_at: Time.now - 1.day)
      post2 = Post.create(title: 'title2', text: 'content2', author: user, comments_counter: 0, likes_counter: 0,
                          created_at: Time.now - 2.days)
      post3 = Post.create(title: 'title3', text: 'content3', author: user, comments_counter: 0, likes_counter: 0,
                          created_at: Time.now - 3.days)

      expect(user.recent_posts).to eq([post1, post2, post3])
    end

    it 'returns all posts if user has less than 3 posts' do
      user = User.create(name: 'John Doe', photo: 'User photo', bio: 'User bio', posts_counter: 0)
      post1 = Post.create(title: 'title1', text: 'content1', author: user, comments_counter: 0, likes_counter: 0,
                          created_at: Time.now - 1.day)
      post2 = Post.create(title: 'title2', text: 'content2', author: user, comments_counter: 0, likes_counter: 0,
                          created_at: Time.now - 2.days)

      expect(user.recent_posts).to eq([post1, post2])
    end

    it 'returns an empty array if user has no posts' do
      user = User.create(name: 'John Doe', photo: 'User photo', bio: 'User bio', posts_counter: 0)

      expect(user.recent_posts).to eq([])
    end
  end

  describe 'name validation' do
    it 'requires name to be present' do
      user = User.new(photo: 'User photo', bio: 'User bio', posts_counter: 0)
      expect(user.valid?).to be_falsey
      expect(user.errors[:name]).to include("can't be blank")
    end
  end
end
