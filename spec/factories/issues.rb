FactoryGirl.define do
  factory :issue do
    issue_name "creating a bug"
    issue_type "bug"
    description "this issue need to be solved"
    status "open"
    comment "this status is closed"
  end
end
