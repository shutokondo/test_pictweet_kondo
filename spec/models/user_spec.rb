require 'rails_helper'

describe User do
  it "is invalid with nickname over 6 letters" do
    user = build(:user, nickname: 'shutokondo')
    user.valid?
    expect(user.errors[:nickname]).to include('is too long (maximum is 6 characters)')
  end

  #nicknameとemailがあれば有効
  it "is valid with nickname and email" do
    user = build(:user)
    expect(user).to be_valid
  end

  #emailが空だと無効
  it "is invalid without email" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  #nicknameが空だと無効
  it "is invalid without nickname" do
    user = build(:user, nickname: nil)
    user.valid?
    expect(user.errors[:nickname]).to include("can't be blank")
  end

  #重複したemailは無効
  it "is invalid with a duplicate email" do
    create(:user, email: 'test@gmail.com')
    user = build(:user, email: 'test@gmail.com')
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "returns a tweet's count of current_user" do
    user = create(:user)
    tweet = create(:tweet)
    expect(user.count_tweets).to eq user.count_tweets
  end
end