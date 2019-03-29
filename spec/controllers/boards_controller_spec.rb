require 'rails_helper'

RSpec.describe BoardsController, type: :controller do

  describe 'Get #new' do
    before { get :new } 
      
      it 'レスポンスコードが200であること' do
        expect(response).to have_http_status(:ok)
      end

      it 'newテンプレートにレンダリングできること' do
        expect(response).to render_template :new
      end

  end
end
