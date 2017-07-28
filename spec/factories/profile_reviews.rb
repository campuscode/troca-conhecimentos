FactoryGirl.define do
  factory :profile_review do
    rating 1
    comment "MyText"
    profile
    user
  end
end
