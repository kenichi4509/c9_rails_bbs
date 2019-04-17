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

      it '新しいboardオブジェクトがビューに渡されること' do
        expect(assigns(:board)).to be_a_new Board
      end
  end


  describe 'POST #create' do
    context '正しい投稿がされたとき' do
      let(:params) do
        { board: {
            name: 'name1',
            title: 'title1',
            body: 'body1',
          }
        }
      end

      it '投稿数が一つ増えること' do
        expect { post :create, params: params }.to change(Board, :count).by(1)
      end

      it 'リダイレクトされること' do
        expect(post :create, params: params).to redirect_to(board)
      end
    end
    

    context '正しくない投稿がされたとき' do
      let(:params) do
        { board: {
            name: '',
            title: '',
            body: '',
           }
        }
      end

      it '投稿数が増えないこと' do
        expect{ post :create, params: params }.to change(Board, :count).by(0)
      end

      it 'リダイレクトされること' do
        expect(post :create, params: params).to redirect_to(new_board_path)
      end
    end

  end


end
