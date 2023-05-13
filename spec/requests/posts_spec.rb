require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  context 'status is succesful ' do
    it 'index returns a success response' do
      get '/users/1/posts'
      expect(response).to be_successful
    end
  end
  context 'the right place holder text is rendered ' do
    it 'renders all posts for a particular user on the page ' do
      get '/users/1/posts'
      expect(response.body).to include('The following is a list of posts')
    end

    it 'renders all the specifics of a single post based on the id ' do
      get '/users/1/posts/3'
      expect(response.body).to include('This is a post whose id is 3')
    end
  end

  describe 'GET /show' do
    before :each do
      get '/users/:user_id/posts/:id'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render show' do
      expect(response).to render_template(:show)
    end
  end
end
