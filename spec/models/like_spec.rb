require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:example) do
    @user = User.create(name: 'John Doe', photo: 'User photo', bio: 'User to bio', posts_counter: 0)
    @post = Post.create(title: 'title', text: 'content', author: @user, comments_counter: 0, likes_counter: 0)
  end

  it 'should belong to a user' do
    like = Like.new(author: @user, post: @post)
    expect(like.author).to eq(@user)
  end

  it 'should belong to a post' do
    like = Like.new(author: @user, post: @post)
    expect(like.post).to eq(@post)
  end

  it 'should validate the presence of an author' do
    like = Like.new(post: @post)
    expect(like.save).to be_falsey
  end

  it 'should validate the presence of a post' do
    like = Like.new(author: @user)
    expect(like.save).to be_falsey
  end

  it 'should update the post likes_counter after saving a like' do
    like = Like.new(author: @user, post: @post)
    like.save
    expect(@post.reload.likes_counter).to eq(1)
  end
end
