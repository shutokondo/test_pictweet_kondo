require 'rails_helper'

describe UsersController do
  let(:user) { create(:user) }
  before { sign_in user }
  describe 'GET #show' do
    it "assigns the requested nickname to @nickname" do
      get :show, id: user
      expect(assigns(:nickname)).to eq user.nickname
    end

    it "populates an array of user's tweets with 5" do
      tweets = create_list(:tweet, 5)
      get :show, id: user
      expect(assigns(:tweets)).to eq user.tweets
    end

    it "check the count of user's tweets" do
      tweet = create(:tweet, user: user)
      get :show, id: user
      expect(assigns(:tweets_count)).to eq user.count_tweets
    end

    it "renders the :show template" do
      get :show, id: user
      expect(response).to render_template :show
    end
  end
end