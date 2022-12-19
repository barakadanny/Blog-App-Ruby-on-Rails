require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    before(:example) do
      get '/users/1/posts'
    end

    it 'returns a 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'returns a template' do
      expect(response).to render_template(:index)
    end

    it 'return a template with a placeholder' do
      expect(response.body).to include('posts view')
    end
  end

  describe 'GET /show' do
    before(:example) do
      get '/users/1/posts/1'
    end

    it 'returns a 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'returns a template' do
      expect(response).to render_template(:show)
    end

    it 'return a template with a placeholder' do
      expect(response.body).to include('Hello views')
    end
  end
end
