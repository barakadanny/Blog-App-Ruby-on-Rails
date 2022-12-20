require 'rails_helper'

RSpec.describe 'renders users Posts Page', type: :feature do
  before :each do
    @user = User.create(name: 'Baraka Danny', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'This is for testing purpose', post_counter: 6)
    @user2 = User.create(name: 'Danny John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'This is for testing purpose', post_counter: 9)
    @post1 = Post.create(user: @user, title: 'lion', text: 'anything on unit tests')
    @post2 = Post.create(user: @user, title: 'gun', text: 'anything on unit tests')
    Like.create(user: @user2, post: @post1)
    Like.create(user: @user2, post: @post2)
    Comment.create(user: @user2, post: @post1, text: 'This is a comment')
  end

  scenario 'should display user name and bio' do
    visit user_posts_path(id: @user.id)
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user.bio)
  end

  scenario 'should display user posts' do
    visit user_posts_path(id: @user.id)
    expect(page).to have_content(@post1.title)
    expect(page).to have_content(@post2.title)
  end

  scenario 'should display user posts likes' do
    visit user_posts_path(id: @user.id)
    expect(page).to have_content(@post1.likes.count)
    expect(page).to have_content(@post2.likes.count)
  end

  scenario 'should display user posts comments' do
    visit user_posts_path(id: @user.id)
    expect(page).to have_content(@post1.comments.count)
    expect(page).to have_content(@post2.comments.count)
  end

  scenario 'should redirect to post show page' do
    visit user_posts_path(id: @user.id)
    click_link(@post1.title)
    expect(page).to have_current_path(post_path(id: @post1.id))
  end
end
