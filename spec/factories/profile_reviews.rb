FactoryGirl.define do
  factory :profile_review do
    rating 1
    comment "MyText"
    profile nil
    user nil
  end
end
