FactoryGirl.define do
  sequence(:email) {|n| "user.#{n}@domain.com" }
  sequence(:username) {|n| "username#{n}" }
  factory :user do
    name "Prakruthi"
    username "Prakruthis.20"
    email "prakruthi@gmail.com"
    password "prakruthis@20"
    password_confirmation "prakruthis@20"
  end
end
