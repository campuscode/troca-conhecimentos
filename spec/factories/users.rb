FactoryGirl.define do
  factory :user do
    email
    password  '123456' 
  end

  sequence :email do |n|
    "usuario#{n}@example.com"
  end

end
