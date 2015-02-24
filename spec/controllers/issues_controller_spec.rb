require 'rails_helper'

RSpec.describe IssuesController, :type => :controller do


  it "should be able to create issue" do
    issue_params = {
      issue: {
        issue_name: "creating a bug",
        issue_type: "bug",
        description: "this bug needs to be solved",
        status: "open",
        comment: "this status is closed"
      }
    }

    post :create, issue_params
     expect(Issue.count).to eq 1

  end
end