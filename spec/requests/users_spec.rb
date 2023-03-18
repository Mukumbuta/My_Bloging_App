require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'GET index' do
    before :each do
      get '/users'
    end
    it 'index returns a success response' do
      expect(response).to be_successful
    end

    it 'index returns a 201 response' do
      expect(response).not_to have_http_status(:created)
    end

    it 'renders all users on the page ' do
      expect(response.body).to include('This is a list of all users')
    end
  end

  describe 'GET /show' do
    before :each do
      get '/users/:id'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should return show' do
      get '/users/5'
      expect(response).to render_template(:show)
    end
  end

  context 'the right text is being rendered ' do
    it 'renders all the specifics of a single user based on the id ' do
      get '/users/1'
      expect(response.body).to include('These are the details of only one user whose id is 1')
    end

    it 'renders the correct view template' do
      get root_path
      expect(response).to render_template(:index)
    end
  end
end
