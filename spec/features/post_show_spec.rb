require 'rails_helper'

RSpec.describe 'Post Show Page', type: :feature do
  describe 'Viewing Post Show page' do
    before(:each) do
      @user1 = User.create(name: 'Jon', photo: 'https://i.pravatar.cc/300?img=58', bio: 'Test user', posts_counter: 1)

      @post = Post.create(author: @user1, title: 'Test post', text: 'Post text', comments_counter: 0, likes_counter: 0)

      @comment = Comment.create(post: @post, author: @user1, text: 'Hi, this is a comment')

      visit user_post_path(@user1, @post)
    end

    # I can see the post's title.
    it 'should show post title' do
      expect(page).to have_content(@post.title)
    end

    # I can see who wrote the post.
    it 'should show post author' do
      expect(page).to have_content(@post.author.name)
    end

    # I can see how many comments it has.
    it 'should show comments counter' do
      expect(page).to have_content(@post.comments_counter)
    end

    # I can see how many likes it has.
    it 'should show likes counter' do
      expect(page).to have_content(@post.likes_counter)
    end

    # I can see the post body.
    it 'should show post text' do
      expect(page).to have_content(@post.text)
    end

    # I can see the username of each commentor.
    it 'should show comment author' do
      expect(page).to have_content(@comment.author.name)
    end

    # I can see the comment each commentor left.
    it 'should show comment text' do
      expect(page).to have_content(@comment.text)
    end
  end
end
