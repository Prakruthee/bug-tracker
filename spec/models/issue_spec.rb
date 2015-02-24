require 'rails_helper'

RSpec.describe Issue, :type => :model do

  let(:issue) {FactoryGirl.create(:issue)}
  context "Factory settings for users" do

    it "should validate the issue factories" do
      expect(FactoryGirl.build(:issue).valid?).to be true
    end
  end

  describe Issue do
    it { should validate_presence_of :issue_name }
    it { should validate_presence_of :issue_type }
    it { should validate_presence_of :description }
    it { should allow_value('creating a bug').for(:issue_name)}
    it { should allow_value('bug').for(:issue_type)}
    it { should allow_value('this issue need to be solved').for(:description)}
  end

  it "should validate issue_name length" do

    issue.issue_name = "sge"*15
    issue.valid?
    expect(issue.errors[:issue_name].size).to be 1

    issue.issue_name = "s"
    issue.valid?
    expect(issue.errors[:issue_name].size).to be 0

  end
end
