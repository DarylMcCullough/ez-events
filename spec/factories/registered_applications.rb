FactoryGirl.define do
  factory :registered_application do
    sequence(:name){|n| "app_#{n}" }
    sequence(:url){|n| "http://example.com/page_#{n}.html" }
    user nil
  end
end
