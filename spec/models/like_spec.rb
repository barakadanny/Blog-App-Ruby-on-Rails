require 'rails_helper'

RSpec.describe Like, type: :model do
  person = User.create(
    name: 'Test',
    photo: 'https://test.com/me.png',
    bio: 'Iam Test Running.',
    post_counter: 0
  )

  post = Post.create(
    title: 'Today',
    text: 'Blue sky',
    comments_counter: 0,
    likes_counter: 0,
    user_id: person.id
  )

  like = Like.create(post: post, user: person)

  context 'update_likes_counter' do
    like.update_likes_counter

    it ' incriment likes_counter' do
      expect(Post.find(post.id).likes_counter).eql?(post.likes_counter + 1)
    end
  end
end
