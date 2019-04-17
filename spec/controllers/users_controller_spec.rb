require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #new' do
    before { get :new }

    it 'レスポンスコードが200であること' do
      expect(response).to have_http_status(200)
    end

    it 'newアクションがレンダリングされること' do
      expect(response).to render_template :new
    end

    it '新しいuserオブジェクトがviewに渡されること' do
      expect(assigns(:user)).to be_a_new User
    end
  end


  describe 'POST #create' do
    context '正しいユーザー情報が渡ってきた場合' do
      let(:params) do
        { user: {
            name: 'user',
            password: 'password',
            password_confirmation: 'password',
          }
        }
      end

      it 'ユーザー数が一人増えていること' do
        expect { post :create, params: params }.to change(User, :count).by(1)
      end

      it 'リダイレクトされること' do
        expect(post :create, params: params).to redirect_to(mypage_path)
      end

    end

    context '正しくないユーザー情報が渡ってきた場合' do
      let(:params) do
        { user: {
            name: 'user',
            password: 'pass',
            password_confirmation: 'pass2'
          }
        }
      end

      it 'ユーザー数が増えないこと' do
        expect { post :create, params: params}.to change(User, :count).by(0)
      end

      it 'リダイレクトされること' do
        expect(post :create, params: params).to redirect_to(new_user_path)
      end
    end

  end



end
