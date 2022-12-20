require 'rails_helper'

RSpec.describe 'renders users Post Page', type: :feature do
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

  scenario 'It should show the post title' do
    visit post_path(id: @post1.id)
    expect(page).to have_content(@post1.title)
  end

  scenario 'It should show the post text' do
    visit post_path(id: @post1.id)
    expect(page).to have_content(@post1.text)
  end

  scenario 'It should show the post likes' do
    visit post_path(id: @post1.id)
    expect(page).to have_content(@post1.likes.count)
  end

  scenario 'It should show the post comments' do
    visit post_path(id: @post1.id)
    expect(page).to have_content(@post1.comments.count)
  end

  scenario 'It should show the post author' do
    visit post_path(id: @post1.id)
    expect(page).to have_content(@post1.user.name)
  end

  scenario 'It should show the username of the commentor' do
    visit post_path(id: @post1.id)
    expect(page).to have_content(@post1.comments.first.user.name)
  end
end
