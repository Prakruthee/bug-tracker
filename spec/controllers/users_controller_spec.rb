require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:user) {FactoryGirl.create(:user)}

  describe "POST create" do
    it "should be able to create user" do
      user_params = {
        user: {
          name: "Bobmiller",
          email: "adam@trimediatlantic.com",
          password: "Password@1",
          password_confirmation: "Password@1"
        }
      }
      expect do
        post :create, user_params
      end.to change(User, :count).by(1)
    end
  end
end



