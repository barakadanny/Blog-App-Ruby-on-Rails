require 'rails_helper'

RSpec.describe 'Users Index Page', type: :feature do
  before :each do
      @user = User.create(name: 'Baraka Danny', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'This is for testing purpose', post_counter: 6)
      @user2 = User.create(name: 'Danny John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'This is for testing purpose', post_counter: 9)
    end
    scenario 'I can see the username of all other users' do
      visit '/'
      expect(page).to have_content(@user.name)
      expect(page).to have_content(@user2.name)
    end

    scenario 'I can see the profile picture for each user' do
      visit user_path(id: @user.id)
      visit user_path(id: @user2.id)
      find("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
      find("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
    end

    scenario 'I can see the number of posts each user has written' do
      visit '/'
      expect(page).to have_content(@user.post_counter)
    end

    scenario 'When I click on a user, I am redirected to that users show page' do
      visit '/'
      click_link(@user.post_counter)
      expect(page).to have_content(@user.name)
    end
end
