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
    expect(user).to be_invalid

    user.username = "s"
    user.valid?
    expect(user.errors[:username].size).to be 1
    expect(user).to be_invalid

    user.username = "Prakruthis.20"
    user.valid?
    expect(user.errors[:username].size).to be 0
    expect(user).to be_valid
  end


  it "should validate password length" do

    user.password = "sgd"
    user.valid?
    expect(user.errors[:password].size).to be 1
    expect(user).to be_invalid

    user.password = "prakruthis@20"
    user.valid?
    expect(user.errors[:password].size).to be 0
    expect(user).to be_valid
  end


  it "should validate email" do
    # checking valid email
    ["something.123@domain.com", "something_123@domain.com"].each do |n|
      user.email = n
      value = user.valid?
      expect(value).to be_truthy
    end

    # checking invalid email
    ["something.123.domain.com", "something.com"].each do |n|
      user.email = n
      value = user.valid?
      expect(value).to be_falsy
    end
  end

  it "should validate password" do
    # checking valid password
    ["prakruthis@20", "prakruthis@20"].each do |n|
      user.password = n
      value = user.valid?
      expect(value).to be_truthy
    end

    # checking invalid password
    ["Password", "Password"].each do |n|
      user.password = n
      value = user.valid?
      expect(value).to be_falsy
    end
  end

end
