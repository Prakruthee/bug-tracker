require 'rails_helper'

RSpec.describe User, :type => :model do

  let(:user) {FactoryGirl.create(:user)}
  context "Factory settings for users" do

    it "should validate the user factories" do
      expect(FactoryGirl.build(:user).valid?).to be true
    end
  end

  describe User do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :username }
    it { should validate_presence_of :password }
    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:username) }
    it { should allow_value('something@domain.com').for(:email)}
    it { should allow_value('PrakruthiS').for(:username)}
    it { should allow_value('password@1').for(:password)}
  end

  it "should validate username length" do

    user.username = "sg"*256
    user.valid?
    expect(user.errors[:username].size).to be 1

    user.username = "s"
    user.valid?
    expect(user.errors[:username].size).to be 1
    expect(user).to be_invalid

    user.username = "Prakruthis.20"
    user.valid?
    expect(user.errors[:username].size).to be 0
  end



  it "should validate password length" do

    user.password = "sgd"
    user.valid?
    expect(user.errors[:password].size).to be 1


    user.password = "prakruthis@20"
    user.valid?
    expect(user.errors[:password].size).to be 0

  end

  it "should validate username" do
    # checking valid usernames
      user.username = "prakruthi.20"
      value = user.valid?
      expect(value).to be_truthy

    # checking invalid usernames
      user.username = "m"
      value = user.valid?
      expect(value).to be_falsy
  end

  it "should validate email" do
    # checking valid email
      user.email = "something_123@domain.com"
      value = user.valid?
      expect(value).to be_truthy

    # checking invalid email
      user.email = "something.com"
      value = user.valid?
      expect(value).to be_falsy
  end

  it "should validate password" do
    # checking valid password
      user.password = "prakruthi@20"
      value = user.valid?
      expect(value).to be_truthy

    # checking invalid password
      user.password = "pas"
      value = user.valid?
      expect(value).to be_falsy
  end
end
