require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = User.create(name: 'John Doe', photo: 'User photo', bio: 'User bio', posts_counter: 0)
    @post = Post.create(title: 'title', text: 'content', author: @user, comments_counter: 0, likes_counter: 0)
  end

  it 'should belong to a user' do
    comment = Comment.new(author: @user, post: @post)
    expect(comment.author).to eq(@user)
  end

  it 'should validate the presence of an author' do
    comment = Comment.new(post: @post)
    expect(comment.save).to be_falsey
  end

  it 'should validate the presence of a post' do
    comment = Comment.new(author: @user)
    expect(comment.save).to be_falsey
  end

  it 'should update the post comments_counter after saving a comment' do
    comment = Comment.new(author: @user, post: @post, text: 'comment text')
    comment.save
    expect(@post.reload.comments_counter).to eq(1)
  end
end
