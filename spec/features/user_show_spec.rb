require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  describe 'Viewing User Show page' do
    before(:each) do
      @user = User.create(name: 'Tom', photo: 'https://i.pravatar.cc/300?img=58', bio: 'Test user', posts_counter: 1)

      @post = Post.create(author: @user, title: 'Test post', text: 'Post text', comments_counter: 0, likes_counter: 0)

      @comment = Comment.create(post: @post, author: @user, text: 'Hi, this is a comment')

      visit "/users/#{@user.id}/"
    end

    it "displays the user's profile picture" do
      expect(page).to have_selector('img[alt="User photo"]')
    end

    it "displays the user's username" do
      expect(page).to have_content(@user.name)
    end

    it 'displays the number of posts the user has written' do
      expect(page).to have_content(@user.posts_counter)
    end

    it "should show the user's bio" do
      expect(page).to have_content(@user.bio)
    end

    it "displays the user's first 3 posts" do
      Post.create(
        [
          {
            author: @user, title: 'First Post', text: 'My first post'
          },
          {
            author: @user, title: 'Second Post', text: 'My Second post'
          },
          {
            author: @user, title: 'Third Post', text: 'My Third post'
          }
        ]
      )
      page.has_content?(@user.posts)
    end

    it 'should have a button to view all of a user posts' do
      expect(page).to have_link('See all posts')
    end

    it 'should redirect to post show page when clicking on post.' do
      click_link @post.title
      expect(page).to have_current_path(user_post_path(@user, @post))
    end

    it 'should redirect to user posts index page when clicking on see all posts.' do
      click_link 'See all posts'
      expect(page).to have_current_path(user_posts_path(@user))
    end

    it 'should show comments counter' do
      expect(page).to have_content(@post.comments_counter)
    end

    it 'should show likes counter' do
      expect(page).to have_content(@post.likes_counter)
    end

    it 'should show name of commenter' do
      expect(page).to have_content(@comment.author.name)
    end
  end
end
