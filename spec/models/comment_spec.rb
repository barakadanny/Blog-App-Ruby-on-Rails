require 'rails_helper'

RSpec.describe Comment, type: :model do
  p person = User.create(
    name: 'Test',
    photo: 'https://test.com/me.png',
    bio: 'Iam Test runnint.',
    post_counter: 0
  )

  post = Post.create(
    title: 'Today',
    text: 'Blue sky',
    comments_counter: 0,
    likes_counter: 0,
    user_id: person.id
  )

  comment = Comment.create(post: post, user: person)

  context 'update_comments_counter' do
    comment.update_comments_counter

    it ' incriment comments_counter' do
      expect(Post.find(post.id).comments_counter).eql?(post.comments_counter + 1)
    end
  end
end
