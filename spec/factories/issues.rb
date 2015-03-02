FactoryGirl.define do

  factory :issue do
    issue_name "creating a bug"
    issue_type "bug"
    comment "this status is closed"
    description "this issue need to be solved"
    status "open"
    user
  end
end
