require 'rails_helper'

RSpec.describe IssuesController, :type => :controller do

  let(:user) {FactoryGirl.create(:user, email: "email1111@domain.com", username: "usernames")}
  let(:issue) {FactoryGirl.create(:issue)}

  it "should be able to create issue" do
    issue_params = {
      issue: {
        issue_name: "creating a bug",
        issue_type: "bug",
        comment: "this status is closed",
        description: "this bug needs to be solved",
        status: "open"
      }
    }
    expect do
      session[:user_id] = user.id
        post :create, issue_params
      end.to change(Issue, :count).to eq(1)
    end

  it "updates the requested issue" do
    value = issue
    patch :update, {:id => value.id, :issue =>
                    {:issue_name =>"creating a bug",
                    :issue_type =>"bug",
                    :description =>"this bug needs to be solved",
                    :status =>"open",
                    :comment =>"this status is closed"}}
    expect(value).should_not eq(issue)
  end

end