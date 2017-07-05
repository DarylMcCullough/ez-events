FactoryGirl.define do
  password = "helloworld"
  factory :user do
    sequence(:email){|n| "user#{n}@factory.com" }
    password password
    password_confirmation password
  end
end
