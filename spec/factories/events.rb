FactoryGirl.define do
  
  factory :event do
    sequence(:name){|n| "event_#{n}" }
    registered_application nil
  end
end
