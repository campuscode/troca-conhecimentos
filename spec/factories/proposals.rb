FactoryGirl.define do
  factory :proposal do
    description "MyText"
    requested_knowledge "MyText"
    email "MyString"
    day_period "MyString"
    meeting_type "MyString"
    user
    ad
  end
end
