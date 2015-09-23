require 'rails_helper'

describe TweetsController do

  describe 'GET #index' do
    it "populates an array of latest five tweets" do
      tweets = create_list(:tweet, 5)
      get :index
      expect(assigns(:tweets)).to match_array(tweets)
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    before { sign_in  create(:user) }
      it "saves the new contact in the database" do
        expect{
          post :create, tweet: attributes_for(:tweet)
        }.to change(Tweet, :count).by(1)
      end

      it "renders the :create template" do
        post :create, tweet: attributes_for(:tweet)
        expect(response).to render_template :create
      end
  end

    describe 'GET #edit' do
    it "assigns the requested tweet to @tweet" do
      tweet = create(:tweet)
      get :edit, id: tweet
      expect(assigns(:tweet)).to eq tweet
    end

    it "renders the :edit template" do
      tweet = create(:tweet)
      get :edit, id: tweet
      expect(response).to render_template :edit
    end
  end

  describe 'PUTCH #update' do
    let!(:user) { create(:user) }
    before { sign_in user }
    it "changes @tweet's attributes" do
      tweet = create(:tweet, user: user)
      patch :update, id: tweet, text: 'programming now', image: 'http://cat.png'
      tweet.reload
      expect(tweet.text).to eq('programming now')
      expect(tweet.image).to eq('http://cat.png')
    end

    it "renders the :update template" do
      tweet = create(:tweet)
      patch :update, id: tweet
      expect(response).to render_template :update
    end
  end

  describe 'DELETE #destroy' do
    let!(:user) { create(:user) }
    before :each do
      @tweet = create(:tweet, user: user)
      sign_in user
    end
    it "deletes the tweet" do
      expect{
        delete :destroy, id: @tweet
      }.to change(Tweet, :count).by(-1)
    end

    it "renders the :destroy template" do
      delete :destroy, id: @tweet
      expect(response).to render_template :destroy
    end
  end
end