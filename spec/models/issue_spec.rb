require 'rails_helper'

RSpec.describe Issue, :type => :model do

  let(:issue) {FactoryGirl.create(:issue)}
  context "Factory settings for users" do

    it "should validate the issue factories" do
      expect(FactoryGirl.build(:issue).valid?).to eq true
    end
  end

  describe Issue do
    it { should validate_presence_of :issue_name }
    it { should ensure_length_of(:issue_name).is_at_most(34) }
    it { should validate_presence_of :issue_type }
    it { should validate_presence_of :description }
    it { should allow_value('creating a bug').for(:issue_name)}
    it { should allow_value('bug').for(:issue_type)}
    it { should allow_value('this issue need to be solved').for(:description)}
  end
end
