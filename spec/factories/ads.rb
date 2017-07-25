FactoryGirl.define do
  factory :ad do
    requested_knowledge 'Aprender violão'
    offered_knowledge 'Ensinar Ruby on Rails'
    meeting_type 'Presencial'
    day_period 'A noite'
    location 'No metrô'
    avaliability 'Em janeiro'
    active false
    user
  end
end
