require 'rails_helper'

RSpec.describe 'Render posts index page', type: :feature do
  before :each do
    @user = User.create(name: 'Baraka Danny', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Dummy text for testing', post_counter: 6)
    @first_post = Post.create(title: 'Hello', text: 'This is a post text', comments_counter: 0, likes_counter: 0,
                              user_id: @user.id)
    5.times do |_i|
      Comment.create(text: 'Nice post!!', user_id: @user.id, post_id: @first_post.id)
    end
    visit user_post_path(@first_post.user, @first_post)
  end

  scenario 'displays profile picture' do
    visit '/users/1/posts/1/'
    expect(page).to have_content('Post Detail')
  end

  scenario 'display username' do
    expect(page).to have_content(@user.name)
  end

  scenario 'display the how many comments' do
    expect(page).to have_content('5')
  end

  scenario 'display the how many Likes' do
    expect(page).to have_content('0')
  end

  scenario 'Should display post title' do
    expect(page).to have_content(@first_post.title)
  end

  scenario 'Should display post text' do
    expect(page).to have_content(@first_post.text)
  end

  scenario 'Should display pagination' do
    visit '/users/1/posts/'
    expect(page).to have_content('Pagination')
  end

  scenario 'Should redirects to posts show page when you click on post' do
    expect(page).to have_content('Post Detail')
  end
end
