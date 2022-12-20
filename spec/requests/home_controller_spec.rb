require 'rails_helper'

RSpec.describe HomeController, type: :request do
  describe 'GET users' do
    before(:example) { get unauthenticated_root_path }
    it 'returns http ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the splash_screen template' do
      expect(response).to render_template('home/welcome')
    end

    it 'includes the correct placeholder text' do
      expect(response.body).to include 'LOG IN'
    end
  end
end
