require 'rails_helper'

RSpec.describe 'renders users Show Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'King Kong', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'I am a software developerst', post_counter: 9)

    Post.create(user: @user, title: 'lion', text: 'anything on unit tests')
    Post.create(user: @user, title: 'gun', text: 'anything on unit tests')
    Post.create(user: @user, title: 'eel', text: 'anything on unit tests')
    @post = Post.create(user: @user, title: 'doe', text: 'Rails is becoming soooo booooooring')

    visit user_path(id: @user.id)
  end

  it 'should display user name and bio' do
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user.bio)
  end

  it 'should render user profile photo' do
    find("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
  end

  it 'should displays static text' do
    expect(page).to have_content('Bio')
  end

  it 'Shows the User name' do
    expect(page).to have_content(@user1)
  end

  it 'shows number of user posts ' do
    expect(page).to have_content(@user.post_counter)
  end

  it 'it should render the view all user posts link' do
    expect(page).to have_link('See all posts')
  end

  it 'should display the last 3 posts of the user' do
    last_3_posts = @user.posts.order(created_at: :desc).limit(3)
    last_3_posts.each do |post|
      expect(page).to have_content(post.title)
    end
  end
end
