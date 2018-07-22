# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

<<<<<<< HEAD
  xdescribe 'GET #new' do
    it 'returns http success' do
=======
  describe 'GET #new' do
    xit 'returns http success' do
>>>>>>> master
      get :new
      expect(response).to have_http_status(:success)
    end
  end
end
