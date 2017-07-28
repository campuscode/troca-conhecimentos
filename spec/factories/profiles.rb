FactoryGirl.define do
  factory :profile do
    name 'Joao'
    birth_date '14/04/1992'
    city 'São Paulo'
    state 'SP'
    skills 'Mortal pra traz'
    user
  end
end
