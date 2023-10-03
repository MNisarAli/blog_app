require 'rails_helper'

RSpec.describe 'Post Index Page', type: :feature do
  describe 'Viewing Post Index page' do
    before(:each) do
      @user = User.create(name: 'Tom', photo: 'https://i.pravatar.cc/300?img=58', bio: 'Test user', posts_counter: 1)

      @post = Post.create(author: @user, title: 'Test post', text: 'Post text', comments_counter: 0, likes_counter: 0)

      @comment = Comment.create(post: @post, author: @user, text: 'Hi, this is a comment')

      visit user_posts_path(@user)
    end

    # I can see the user's profile picture.
    it 'should show user photo' do
      expect(page.html).to include(@user.photo)
    end

    # I can see the user's username.
    it 'should show user name' do
      expect(page).to have_content(@user.name)
    end

    # I can see the number of posts the user has written.
    it 'should show posts_counter of clicked user' do
      expect(page).to have_content(@user.posts_counter)
    end

    # I can see a post's title.
    it 'should show post title' do
      expect(page).to have_content(@post.title)
    end

    # I can see some of the post's body.
    it 'should show post text' do
      expect(page).to have_content(@post.text)
    end

    # I can see the first comments on a post.
    it 'should show first comment on post' do
      expect(page).to have_content(@comment.text)
    end

    # I can see how many comments a post has.
    it 'should show comments counter' do
      expect(page).to have_content(@post.comments_counter)
    end

    # I can see how many likes a post has.
    it 'should show likes counter' do
      expect(page).to have_content(@post.likes_counter)
    end

    # I can see a section for pagination if there are more posts than fit on the view.
    it 'should show pagination button' do
      expect(page).to have_button('Pagination')
    end

    # When I click on a post, it redirects me to that post's show page.
    it 'should redirect to post show page when clicking on post' do
      click_link @post.title
      expect(page).to have_current_path(user_post_path(@user, @post))
    end
  end
end
