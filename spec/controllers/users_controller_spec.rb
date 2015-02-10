require 'rails_helper'

RSpec.describe UsersController, :type => :controller do


  it "should be able to create user" do
    user_params = {
      user: {
        name: "BBBBB",
        email: "adam_25@yopmail.com",
        password: "password",
        password_confirmation: "password"
      }
    }
    session[:user_id] = nil
    expect do
      post :create, user_params
    end.to change(User, :count).by(1)
    expect(session[:user_id]).not_to eq nil
  end
end